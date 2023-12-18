<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Command;

use App\Service\CreateAdminService;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

#[AsCommand(
    name: 'app:create-admin',
    description: 'creation un nouvel Admin',
)]
// symfony console app:create-admin

class CreateAdminCommand extends Command
{
    public function __construct(
        private readonly CreateAdminService $createAdminService
    ) {
        parent::__construct();
    }

    protected function configure(): void
    {
        $this
            ->addArgument('email', InputArgument::REQUIRED, 'Email')
            ->addArgument('pseudo', InputArgument::REQUIRED, 'Pseudo')
            ->addArgument('password', InputArgument::REQUIRED, 'Password')
            // ->addOption('option1', null, InputOption::VALUE_NONE, 'Option description')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $email = $input->getArgument('email');
        $pseudo = $input->getArgument('pseudo');
        $password = $input->getArgument('password');

        $this->createAdminService->create($email, $pseudo, $password);

        $io->success('un admin a bien été créé');

        return Command::SUCCESS;
    }
}
