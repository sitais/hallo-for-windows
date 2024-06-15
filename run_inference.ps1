$source_image="assets/OIP.jpg"
$driving_audio="assets/test.wav"
$output="test.mp4"
$face_expand_ratio=""

Set-Location $PSScriptRoot
.\venv\Scripts\activate

$Env:HF_HOME = "huggingface"
$Env:XFORMERS_FORCE_DISABLE_TRITON = "1"
$ext_args = [System.Collections.ArrayList]::new()

if ($output) {
  [void]$ext_args.Add("--output=$output")
}

if ($face_expand_ratio) {
  [void]$ext_args.Add("--face_expand_ratio=$face_expand_ratio")
}

python.exe "./scripts/inference.py" `
--source_image=$source_image `
--driving_audio=$driving_audio `
 $ext_args
