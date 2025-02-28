# Nix Darwin Dotfiles

Apple Silicon Mac用のnix-darwinを利用した包括的なdotfiles。1つのコマンドでCLIからGUIまでmacOS環境を完全に構築！

## 機能

- 🛠 macOS システム設定の最適化
- 🐚 Home Manager を使用した最新のシェル設定
- 📦 CLIツールの自動インストール
- 🖥 GUIアプリのHomebrew管理
- ⚡️ 高速かつ再現可能なセットアップ

## システム要件

### ハードウェア
- Apple Silicon Mac (M1/M2/M3/M4シリーズ)

### ソフトウェア
- macOS 15 Sequoia以降
- インターネット接続

### 推奨
- クリーンなmacOSインストール
- Homebrew未インストール
- nix未インストール

## ⚠️ バックアップの推奨

セットアップを開始する前に、以下の設定をバックアップしてください：
1. Homebrewの設定およびインストール済みパッケージ
2. シェルの設定ファイル (~/.zshrc, ~/.bashrc)
3. 既存のnix設定

## インストール手順

1. リポジトリをクローン:
```bash
cd <YOUR_DESIRED_LOCATION>
git clone git@github.com:atalienet/dotfiles.git
```

2. `./env.nix` ファイル内のユーザー名を自分のものに変更してください。  
   デフォルトの `u1` を自分のユーザー名に置き換えます。例：

```nix
{
  default = {
    system = "aarch64-darwin";
    username = "u1";
  };

  username = "u1";
}
```

を以下のように変更：

```nix
{
  default = {
    system = "aarch64-darwin";
    username = "<YOUR_USERNAME>";
  };

  username = "<YOUR_USERNAME>";
}
```

3. セットアップの実行:
```bash
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch --flake <YOUR_DESIRED_LOCATION>/dotfiles/nix-darwin.#default
```

4. Macを再起動して、すべての設定を適用してください！

## 設定の管理

### 変更の適用
```bash
darwin-rebuild switch --flake <YOUR_DESIRED_LOCATION>/dotfiles/nix-darwin.#default
```

## インストールされるソフトウェア

### 開発ツール
- **GnuPG**: 暗号化と署名
- **pinentry-mac**: macOSネイティブのパスワード入力ダイアログ
- **Xcodes**: 複数バージョンのXcodeをインストール・切り替え可能なCLIツール
- **1Password CLI**: 1Passwordパスワードマネージャーのコマンドラインインターフェース

### ターミナルエミュレータ
- **Rio**: RustベースのモダンなGPU加速ターミナルエミュレータ
- **Ghostty**: 高性能なフォントレンダリングを持つターミナル
- **WezTerm**: クロスプラットフォーム対応のGPU加速ターミナル

### システムユーティリティ
- **CoconutBattery**: バッテリー情報と健康状態の詳細なモニタリング
- **KeyClu**: キーボードショートカットの可視化・探索ツール

### インストール方法

| アプリケーション | インストール方法 | タイプ | 説明 |
|-----------------|----------------|-------|------|
| GnuPG            | nix-darwin     | CLI   | 暗号化と署名ツール |
| pinentry-mac     | nix-darwin     | CLI   | macOSネイティブのパスワード入力ダイアログ |
| Xcodes           | Homebrew       | GUI   | Xcodeバージョンマネージャー |
| 1Password CLI    | Homebrew       | CLI   | パスワードマネージャーのCLI |
| Rio              | Homebrew       | GUI   | Rustベースのターミナルエミュレータ |
| Ghostty          | Homebrew       | GUI   | モダンなGPU加速ターミナル |
| WezTerm          | Homebrew       | GUI   | クロスプラットフォームターミナル |
| CoconutBattery   | Homebrew       | GUI   | バッテリーモニタ |
| KeyClu           | Homebrew       | GUI   | キーボードショートカット探索ツール |

## ロードマップ

| 優先度 | 機能 | 目標日 | ステータス |
|--------|------|--------|------------|
| 🔥 高  | 設定のモジュール化 | 2025年3月 | 進行中 |
| 🔥 高  | Homebrew Tapサポート（航空宇宙） | 2025年3月 | 計画中 |
| 🔥 高  | 柔軟な環境変数サポート | 2025年3月 | 計画中 |
| ⚡️ 中 | Zsh設定の強化 | 2025年4月 | 計画中 |
| ⚡️ 中 | Neovim設定 | 2025年3月 | 計画中 |
