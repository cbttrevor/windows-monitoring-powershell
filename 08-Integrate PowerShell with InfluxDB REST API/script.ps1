docker run --rm -dit --publish 8086:8086 quay.io/influxdb/influxdb:v2.0.2

# Docs for InfluxDB REST API
# https://docs.influxdata.com/influxdb/v2.0/reference/api/
# https://docs.influxdata.com/influxdb/v2.0/api/#section/Authentication
# https://docs.influxdata.com/influxdb/v2.0/reference/syntax/line-protocol/

while ($true) {
    $Value = Get-Counter -Counter '\Network Interface(Intel[R] Wi-Fi 6 AX200 160MHz)\Bytes Received/sec'
    #$Value.CounterSamples[0].CookedValue
    
    $Params = @{
        Uri = 'http://localhost:8086/api/v2/write?org=cbtnuggets&bucket=cbtnuggets'
        Body = 'ax200 bytes/sec={0}' -f $Value.CounterSamples[0].CookedValue
        Method = 'Post'
        Headers = @{
            Authorization = 'Token PUTYOURTOKENHERE'
        }
    }
    Invoke-RestMethod @Params

    Start-Sleep -Seconds 1
}
