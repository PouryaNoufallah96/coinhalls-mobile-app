allprojects {
    repositories {
        google()
        mavenCentral()
        maven {
            url = uri("https://jitpack.io")
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Force plugins that compile against an old android-XX (e.g. coinbase_wallet_sdk)
// to compile against API 37, and create the consumer-rules.pro file that
// coinbase_wallet_sdk declares but does not ship.
subprojects {
    val applyOverride = {
        if (project.hasProperty("android")) {
            (project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension)
                ?.compileSdkVersion(37)
        }
    }
    if (project.state.executed) {
        applyOverride()
    } else {
        afterEvaluate { applyOverride() }
    }

    if (project.name == "coinbase_wallet_sdk") {
        tasks.matching {
            it.name == "mergeReleaseConsumerProguardFiles" ||
                it.name == "mergeDebugConsumerProguardFiles"
        }.configureEach {
            doFirst {
                val rulesFile = file("${project.projectDir}/consumer-rules.pro")
                if (!rulesFile.exists()) {
                    rulesFile.parentFile.mkdirs()
                    rulesFile.createNewFile()
                }
            }
        }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}