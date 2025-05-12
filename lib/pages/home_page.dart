import 'package:flutter/material.dart';
import '../models/repo_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repos = <RepoModel>[
      RepoModel(
        name: 'Oh My Zsh',
        description: 'Framework de gestión de configuración para Zsh, facilita la personalización de tu terminal.',
        scriptFile: 'ohmyzsh.sh',
        readmeAsset: 'assets/readmes/ohmyzsh.md',
        githubUrl: 'https://github.com/ohmyzsh/ohmyzsh',
      ),
      RepoModel(
        name: 'Powerlevel10k',
        description: 'Tema rápido y altamente personalizable para Zsh.',
        scriptFile: 'powerlevel10k.sh',
        readmeAsset: 'assets/readmes/powerlevel10k.md',
        githubUrl: 'https://github.com/romkatv/powerlevel10k',
      ),
      RepoModel(
        name: 'FZF',
        description: 'Buscador de línea de comandos altamente eficiente escrito en Go.',
        scriptFile: 'fzf.sh',
        readmeAsset: 'assets/readmes/fzf.md',
        githubUrl: 'https://github.com/junegunn/fzf',
      ),
      RepoModel(
        name: 'Exa',
        description: 'Reemplazo moderno de ls con más características como colores y columnas.',
        scriptFile: 'exa.sh',
        readmeAsset: 'assets/readmes/exa.md',
        githubUrl: 'https://github.com/ogham/exa',
      ),
      RepoModel(
        name: 'Ripgrep',
        description: 'Herramienta de búsqueda de texto rápida y respetuosa con expresiones regulares.',
        scriptFile: 'ripgrep.sh',
        readmeAsset: 'assets/readmes/ripgrep.md',
        githubUrl: 'https://github.com/BurntSushi/ripgrep',
      ),
      RepoModel(
        name: 'Bat',
        description: 'Reemplazo de cat con resaltado de sintaxis y paginación.',
        scriptFile: 'bat.sh',
        readmeAsset: 'assets/readmes/bat.md',
        githubUrl: 'https://github.com/sharkdp/bat',
      ),
      RepoModel(
        name: 'Fd',
        description: 'Alternativa simple, rápida y amigable a find.',
        scriptFile: 'fd.sh',
        readmeAsset: 'assets/readmes/fd.md',
        githubUrl: 'https://github.com/sharkdp/fd',
      ),
      RepoModel(
        name: 'Hexyl',
        description: 'Visor hexadecimal amigable para la terminal.',
        scriptFile: 'hexyl.sh',
        readmeAsset: 'assets/readmes/hexyl.md',
        githubUrl: 'https://github.com/sharkdp/hexyl',
      ),
      RepoModel(
        name: 'Neofetch',
        description: 'Muestra información del sistema junto a ASCII del logo de la distro.',
        scriptFile: 'neofetch.sh',
        readmeAsset: 'assets/readmes/neofetch.md',
        githubUrl: 'https://github.com/dylanaraps/neofetch',
      ),
      RepoModel(
        name: 'Termux API',
        description: 'Acceso a las funcionalidades del dispositivo desde Termux.',
        scriptFile: 'termux-api.sh',
        readmeAsset: 'assets/readmes/termux-api.md',
        githubUrl: 'https://github.com/termux/termux-api',
      ),
      RepoModel(
        name: 'Termux App',
        description: 'Aplicación principal de Termux para Android.',
        scriptFile: 'termux-app.sh',
        readmeAsset: 'assets/readmes/termux-app.md',
        githubUrl: 'https://github.com/termux/termux-app',
      ),
      RepoModel(
        name: 'Termux Styling',
        description: 'Personaliza colores y temas de Termux.',
        scriptFile: 'termux-styling.sh',
        readmeAsset: 'assets/readmes/termux-styling.md',
        githubUrl: 'https://github.com/termux/termux-styling',
      ),
      RepoModel(
        name: 'Antigen',
        description: 'Gestor de complementos para Zsh, simplifica la instalación de temas y plugins.',
        scriptFile: 'antigen.sh',
        readmeAsset: 'assets/readmes/antigen.md',
        githubUrl: 'https://github.com/zsh-users/antigen',
      ),
      RepoModel(
        name: 'Zsh Syntax Highlighting',
        description: 'Resalta sintaxis de comandos en Zsh en tiempo real.',
        scriptFile: 'zsh-syntax-highlighting.sh',
        readmeAsset: 'assets/readmes/zsh-syntax-highlighting.md',
        githubUrl: 'https://github.com/zsh-users/zsh-syntax-highlighting',
      ),
      RepoModel(
        name: 'Zsh Autosuggestions',
        description: 'Sugiere comandos basados en historial en Zsh.',
        scriptFile: 'zsh-autosuggestions.sh',
        readmeAsset: 'assets/readmes/zsh-autosuggestions.md',
        githubUrl: 'https://github.com/zsh-users/zsh-autosuggestions',
      ),
      RepoModel(
        name: 'Havoc Framework',
        description: 'Framework modular para pruebas de intrusión en Android.',
        scriptFile: 'havoc-framework.sh',
        readmeAsset: 'assets/readmes/havoc-framework.md',
        githubUrl: 'https://github.com/HavocFramework/Havoc-Framework',
      ),
      RepoModel(
        name: 'HCX Dumptool',
        description: 'Captura y descifra paquetes Wi-Fi con hcxdumptool.',
        scriptFile: 'hcxdumptool.sh',
        readmeAsset: 'assets/readmes/hcxdumptool.md',
        githubUrl: 'https://github.com/Z3APA/hcxdumptool',
      ),
      RepoModel(
        name: 'Sublist3r',
        description: 'Herramienta de recolección de subdominios.',
        scriptFile: 'sublist3r.sh',
        readmeAsset: 'assets/readmes/sublist3r.md',
        githubUrl: 'https://github.com/aboul3la/Sublist3r',
      ),
      RepoModel(
        name: 'Amass',
        description: 'Descubrimiento de activos externos y mapas de red.',
        scriptFile: 'amass.sh',
        readmeAsset: 'assets/readmes/amass.md',
        githubUrl: 'https://github.com/OWASP/Amass',
      ),
      RepoModel(
        name: 'Masscan',
        description: 'Escáner de puertos de alta velocidad.',
        scriptFile: 'masscan.sh',
        readmeAsset: 'assets/readmes/masscan.md',
        githubUrl: 'https://github.com/robertdavidgraham/masscan',
      ),
      RepoModel(
        name: 'Pwncat',
        description: 'Escalador de privilegios vía sockets y sockets invertidos.',
        scriptFile: 'pwncat.sh',
        readmeAsset: 'assets/readmes/pwncat.md',
        githubUrl: 'https://github.com/pwncat/pwncat',
      ),
      RepoModel(
        name: 'Proot Distro',
        description: 'Instala distribuciones Linux completas en Termux.',
        scriptFile: 'proot-distro.sh',
        readmeAsset: 'assets/readmes/proot-distro.md',
        githubUrl: 'https://github.com/termux/proot-distro',
      ),
      RepoModel(
        name: 'MITMf',
        description: 'Marco de pruebas de compromiso de intermediario (MITM).',
        scriptFile: 'mitmf.sh',
        readmeAsset: 'assets/readmes/mitmf.md',
        githubUrl: 'https://github.com/byt3bl33d3r/MITMf',
      ),
      RepoModel(
        name: 'RouterSploit',
        description: 'Framework de explotación de routers y embebidos.',
        scriptFile: 'routersploit.sh',
        readmeAsset: 'assets/readmes/routersploit.md',
        githubUrl: 'https://github.com/threat9/routersploit',
      ),
      RepoModel(
        name: 'Scapy',
        description: 'Manipulación de paquetes e inyección en red.',
        scriptFile: 'scapy.sh',
        readmeAsset: 'assets/readmes/scapy.md',
        githubUrl: 'https://github.com/secdev/scapy',
      ),
      RepoModel(
        name: 'WeeChat',
        description: 'Cliente IRC modular y personalizable.',
        scriptFile: 'weechat.sh',
        readmeAsset: 'assets/readmes/weechat.md',
        githubUrl: 'https://github.com/weechat/weechat',
      ),
      RepoModel(
        name: 'Bettercap',
        description: 'Marco de ataques de capa de enlace y red.',
        scriptFile: 'bettercap.sh',
        readmeAsset: 'assets/readmes/bettercap.md',
        githubUrl: 'https://github.com/bettercap/bettercap',
      ),
      RepoModel(
        name: 'Drozer',
        description: 'Herramienta de seguridad para aplicaciones Android.',
        scriptFile: 'drozer.sh',
        readmeAsset: 'assets/readmes/drozer.md',
        githubUrl: 'https://github.com/FSecureLABS/drozer',
      ),
      RepoModel(
        name: 'Feroxbuster',
        description: 'Escáner de contenido web rápido y recursivo.',
        scriptFile: 'feroxbuster.sh',
        readmeAsset: 'assets/readmes/feroxbuster.md',
        githubUrl: 'https://github.com/epi052/feroxbuster',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('RK13 Installer')),
      body: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];
          return ListTile(
            title: Text(repo.name),
            subtitle: Text(repo.description),
            onTap: () {
              Navigator.of(context).pushNamed('/repo_detail', arguments: repo);
            },
          );
        },
      ),
    );
  }
}
