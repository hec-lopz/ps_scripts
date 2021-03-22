#Get CSV from user
$filePath = Read-Host -Prompt "Enter the path to your CSV file"

#Import data from file
$data = Import-Csv -Path $filePath

Import-Csv .\test.csv
get-member -InputObject $array
echo $array.GetValue(0)
foreach ($item in $data){
    $adGroup = $item.'$AD_GROUP'
    $user = $item.'$User_Name'
    Add-AdGroupMember -Identity $adGroup -Members $user
    $string = 'Added {0} to {1} group'-f $user, $adGroup
    echo $string
}