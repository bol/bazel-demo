package src;

import org.springframework.boot.loader.tools.DefaultLaunchScript;
import org.springframework.boot.loader.tools.Libraries;
import org.springframework.boot.loader.tools.Library;
import org.springframework.boot.loader.tools.LibraryScope;
import org.springframework.boot.loader.tools.Repackager;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>Command line utility wrapping Spring Boot's {@link Repackager} tool.</p>
 * <p>Usage: <code>&lt;command&gt; includeLaunchScript inputJar outputJar dependencyJar dependencyJar...</code></p>
 * <p>Example: <code>&lt;command&gt; true /path/to/mylibrary.jar /path/to/springbootapp.jar /path/to/dependencies/dep1.jar /path/to/dependencies/dep2.jar</code></p>
 */
public final class SpringBootPackager {

    public static void main(String[] args) throws IOException {
        List<String> arguments = Arrays.asList(args);

        boolean includeLaunchScript = Boolean.parseBoolean(arguments.get(0));
        Path inputJar = Paths.get(arguments.get(1));
        Path outputJar = Paths.get(arguments.get(2));

        Repackager repackager = new Repackager(inputJar.toFile());

        Libraries libraries = callback -> {
            List<Path> libs = arguments.subList(3, arguments.size()).stream().map(Paths::get).collect(Collectors.toList());
            for (Path lib : libs) {
                callback.library(new Library(lib.toFile(), LibraryScope.RUNTIME));
            }
        };

        if (includeLaunchScript) {
            repackager.repackage(outputJar.toFile(), libraries, new DefaultLaunchScript(null, Collections.emptyMap()));
        } else {
            repackager.repackage(outputJar.toFile(), libraries);
        }
    }

}
