[CmdletBinding()]
param([string]$ProjectRoot = ".", [switch]$RequireRemote)

$ErrorActionPreference = "Stop"
$root = (Resolve-Path -LiteralPath $ProjectRoot).Path
$required = @('AGENTS.md', 'README.md', 'SKILL.md', '.gitignore', '.gitattributes', 'references/pretext.md', 'for-ai/README.md', 'for-ai/PROJECT.md', 'for-ai/SKILLS.md', 'for-ai/VERIFICATION.md', 'for-ai/WORKFLOW.md', 'for-ai/DECISIONS.md', 'for-ai/scripts/check-context.ps1')
foreach ($relative in $required) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $relative) -PathType Leaf)) { throw "Missing $relative" }
}
if ((Get-Content -Raw -LiteralPath (Join-Path $root 'AGENTS.md')) -notmatch 'for-ai/README\.md') { throw 'AGENTS.md must route to for-ai/README.md' }
if ($RequireRemote) {
    $local = (& git -C $root rev-parse HEAD).Trim()
    $remote = ((& git -C $root ls-remote origin refs/heads/main) -split '\s+')[0]
    if (-not $remote -or $local -ne $remote) { throw 'Local HEAD differs from origin/main' }
}
Write-Output 'PASS: for-ai structure and requested remote gate'
