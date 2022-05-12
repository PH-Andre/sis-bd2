<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Autores e seus livros</h1>


        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'NomeAutor';
        $codigoBarras = 'Titulo';
    /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'select distinct NomeAutor, Titulo 
            from autoria_livros
            join livro on (autoria_livros.autoria_livro_FK = livro.livro_id) 
            join autor on (autoria_livros.autoria_autor_FK = autor.autor_id);'
            ;


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Autor' . '</th>' .
            '        <th>' . 'Escreveu' . '</th>' .
        
            
            /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */
           
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$titulo] . '</td>' .
                    '<td>' . $registro[$codigoBarras] . '</td>';
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
         FecharConexao($conexao);
        ?>
   
    </div>
    <div class="content">
        </body>

</html>