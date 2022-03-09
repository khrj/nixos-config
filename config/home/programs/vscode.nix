{ pkgs, ... }:

{
	programs.vscode = {
		enable = true;
		package = pkgs.vscode-with-extensions.override {
			vscodeExtensions = (with pkgs.vscode-extensions; [
				bbenoist.nix
				matklad.rust-analyzer
				ms-vsliveshare.vsliveshare
			]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
				{
					name = "better-comments";
					publisher = "aaron-bond";
					version = "2.1.0";
					sha256 = "0kmmk6bpsdrvbb7dqf0d3annpg41n9g6ljzc1dh0akjzpbchdcwp";
				}
				{
					name = "vscode-css-formatter";
					publisher = "aeschli";
					version = "1.0.2";
					sha256 = "142kkjsnr65gdsxaqj4q6mi3yv2x935cs7qr2sb7mmz6wiwlwlqc";
				}
				{
					name = "vscode-theme-onedark";
					publisher = "akamud";
					version = "2.2.3";
					sha256 = "1m6f6p7x8vshhb03ml7sra3v01a7i2p3064mvza800af7cyj3w5m";
				}
				{
					name = "project-manager";
					publisher = "alefragnani";
					version = "12.5.0";
					sha256 = "0v2zckwqyl33jwpzjr8i3p3v1xldkindsyip8v7rs1pcmqmpv1dq";
				}
				{
					name = "vscode-zipfs";
					publisher = "arcanis";
					version = "2.3.0";
					sha256 = "041k63d94g0dk88cllh077hvhvk4hl0fm2bdfk1hyna3ywk47mr1";
				}
				{
					name = "vscode-tailwindcss";
					publisher = "bradlc";
					version = "0.7.7";
					sha256 = "08ghx6y5rxfnzxlpb623gb70qhiwa3dqgmy8zac1ywh4nwmi64x9";
				}
				{
					name = "xml";
					publisher = "DotJoshJohnson";
					version = "2.5.1";
					sha256 = "1v4x6yhzny1f8f4jzm4g7vqmqg5bqchyx4n25mkgvw2xp6yls037";
				}
				{
					name = "dprint";
					publisher = "dprint";
					version = "0.10.0";
					sha256 = "0ii83d7khfj6y8i2r8nm45l74bhmjp1qmg57nsklhnhi9wva4raz";
				}
				{
					name = "markdown-table-formatter";
					publisher = "fcrespo82";
					version = "2.2.4";
					sha256 = "0py36ia19s5v3zwqdk903b0n70zmpwwg8hx3l66jsnva8ygzrynl";
				}
				{
					name = "vscode-yarn";
					publisher = "gamunu";
					version = "2.1.0";
					sha256 = "0kh989fm1p4j9in3ci44pjzlckj85m22zhkz4hlcsbjcqirfijqi";
				}
				{
					name = "vscode-graphql";
					publisher = "GraphQL";
					version = "0.3.50";
					sha256 = "1yf6v2vsgmq86ysb6vxzbg2gh6vz03fsz0d0rhpvpghayrjlk5az";
				}
				{
					name = "markdown-formatter";
					publisher = "mervin";
					version = "0.9.7";
					sha256 = "0qmh8dkg16gg2vwk5jiaxnsgik31i8k48msna5q62996zprk58jm";
				}
				{
					name = "vscode-yaml-sort";
					publisher = "PascalReitermann93";
					version = "5.1.3";
					sha256 = "16qbcrkyphi34ssqz231536dcx1psn159962v66z2qyhyxryc72z";
				}
				{
					name = "prisma";
					publisher = "Prisma";
					version = "3.10.0";
					sha256 = "00pw45g08lqb80agpf5qracyai41n71vr6whvb2zflzig2zbgn47";
				}
				{
					name = "vscode-commons";
					publisher = "redhat";
					version = "0.0.6";
					sha256 = "1b8nlhbrsg3kj27f1kgj8n5ak438lcfq5v5zlgf1hzisnhmcda5n";
				}
				{
					name = "vscode-yaml";
					publisher = "redhat";
					version = "1.5.1";
					sha256 = "1qsjsfggfya282rh618fc89cfgpxii7yv2kyh5is6x2r2606cy15";
				}
				{
					name = "rewrap";
					publisher = "stkb";
					version = "17.8.0";
					sha256 = "1y168ar01zxdd2x73ddsckbzqq0iinax2zv3d95nhwp9asjnbpgn";
				}
				{
					name = "vscode-stylelint";
					publisher = "stylelint";
					version = "1.2.2";
					sha256 = "00v31vsp6nnw6zvv6a854cvzh63y9l712z57hh7na4x9if9pk9bg";
				}
				{
					name = "even-better-toml";
					publisher = "tamasfe";
					version = "0.14.2";
					sha256 = "17djwa2bnjfga21nvyz8wwmgnjllr4a7nvrsqvzm02hzlpwaskcl";
				}
				{
					name = "open-in-browser";
					publisher = "techer";
					version = "2.0.0";
					sha256 = "1s5mgw0jaasis0ish3da3dl7vqsgkx9cgrp1mmpgh9c4wlr12xnx";
				}
				{
					name = "errorlens";
					publisher = "usernamehw";
					version = "3.4.2";
					sha256 = "1ifz0iyc7zknb07qx2fixg3qw9i69pvr12rlg2yvg1s8paj8mnbx";
				}
				{
					name = "vscode-lldb";
					publisher = "vadimcn";
					version = "1.6.10";
					sha256 = "1q3d99l57spkln4cgwx28300d9711kc77mkyp4y968g3zyrmar88";
				}
				{
					name = "vscodeintellicode";
					publisher = "VisualStudioExptTeam";
					version = "1.2.17";
					sha256 = "0yp8a6fh2vrn1lw3m9qf8aqpg697xlm5i6y94b0ls5g55lz4lb72";
				}
				{
					name = "vscode-icons";
					publisher = "vscode-icons-team";
					version = "11.10.0";
					sha256 = "0n96jdmqqh2v7mni4qv08qjxyhp8h82ck9rhmwnxp66ni5ybmj63";
				}
				{
					name = "grammarly";
					publisher = "znck";
					version = "0.14.0";
					sha256 = "1z7jm18sf8xqsknr5hzslz779lp35rg4z1mkk3zvjsl6c27l7g0l";
				}
			];
		};
	};
}
