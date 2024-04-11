package it.tau2m.marvin;

import io.micronaut.configuration.picocli.PicocliRunner;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@Command(name = "marvin", version="0.1", description = "Marvin Bot",
        mixinStandardHelpOptions = true)
public class MainCommand implements Runnable {

    @Option(names = {"-v", "--verbose"}, description = "Be more verbose")
    private boolean verbose = false;

    @Option(names = {"-p", "--project"}, description = "mn-dev, gatsby-dev, cjava")
    private String project = null;

    public static void main(String[] args) {
        PicocliRunner.run(MainCommand.class, args);
    }

    public void run() {
        System.out.println("ෆ Marvin is here");

        if (verbose) {
            System.out.println("Verbose option enabled");
        }

        if ( project != null ) {
            if ( verbose ) {
                System.out.println("Project to be initialized: " + project);
            }
            this.runCommand("git", "clone", "https://github.com/mithenks/" + project, ".");
            this.runCommand("rm", "-rf", ".git");
        }
    }

    private void runCommand(String ...args) {

        if (verbose ) {
            System.out.println("Running command: " + String.join(" ", args));
        }

        ProcessBuilder processBuilder = new ProcessBuilder(args);
        try {

            Process process = processBuilder.start();
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream()));

            String line;
            while ((line = reader.readLine()) != null) {
                if ( verbose ) {
                    System.out.println(line);
                }
            }

            int exitVal = process.waitFor();
            if (exitVal == 0) {
                if ( verbose ) {
                    System.out.println("Command executed correctly!");
                }
            } else {
                System.out.println("Command execution returned an error code: " + exitVal);
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
