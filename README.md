## configuración de wsl
### wsl 2
```bash
# instalar
wsl --install
# ver opciones de instalación
wsl  --list --online 
# instalar una distribución
wsl --install <DistroName>
# inicar un distribución 
wsl --install -d <DistroName>
```
### primeras instalaciones
```bash
sudo apt install git curl neofetch build-essential wget unzip zip tar -y
```
### zsh
```bash
# instalar
sudo apt install zsh -y
# hacer predeterminado
chsh -s $(which zsh)
```
- oh my zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- plugins de oh my zsh
```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# activar plugins
nano ~/.zshrc
# editar la linia de plugins
plugins=([plugins...] zsh-syntax-highlighting zsh-autosuggestions)
# reiniciar zsh
source ~/.zshrc
```
### homebrew
```bash
# antes de instalar
sudo apt-get install build-essential procps curl file git
# instalar homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# siguientes pasos
echo >> /home/lagarto/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/lagarto/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```
### c/c++
```bash
# instalar
brew install gcc
# verificar
gcc --version
cpp --version
c++ --version
```
### herramientas 
```bash
# zoxide
brew install zoxide
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
# bat
brew  install bat
# lazygit
brew install lazygit
echo 'alias lg="lazygit"' >> ~/.zshrc
source ~/.zshrc 
# fzf
brew install fzf
# fd
brew install fd
# ripgrep
brew install ripgrep
# eza
brew install eza
echo 'alias ls="eza --icons -l --group-directories-first --no-user --no-time"' >> ~/.zshrc 
echo 'alias lsd="eza --icons -l --group-directories-first"' >> ~/.zshrc 
source ~/.zshrc
# neovim
```
### starship
- instalar
```bash
brew install starship
```
- configuración
```bash
nano ~/.config/starship.toml
```
- archivo
- activar
```bash
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
source ~/.zshrc
```
### zellij
```bash
# instalar
brew install zellij
# layouts
cp -r ~/jos3lo/dots999/zellij/layouts ~/.config/zellij/
# plugins
cp -r ~/jos3lo/dots999/zellij/plugins ~/.config/zellij
# eliminar configuracion por defecto
rm ~/.config/zellij/config.kdl
# copear nueva configuración
cp ~/jos3lo/dots999/zellij/config.kdl ~/.config/zellij
```
### neovim 
- neovim
```bash
brew install neovim
```
- config
```bash
cp nvim ~/.config/
```
La carpeta `nvim` es neovim configurado desde cero con lazy
