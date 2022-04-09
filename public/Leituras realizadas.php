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
        <h1>Leituras Realizadas</h1>


        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'inicio_leitura';
        $codigoBarras = 'final_leitura';
        $genero = 'classificacao_livro';
        $livro = 'leitura_livro';
        $leitor ='leitura_leitor';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'SELECT ' . $titulo .
            '     , ' . $codigoBarras .
            '     , ' . $genero .
            '     , ' . $livro .
            '     , ' . $leitor .
           /*TODO-2: Adicione cada variavel a consulta abaixo */
            '  FROM leitura_efetivadas';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Inicio da leitura' . '</th>' .
            '        <th>' . 'Termino da leitura' . '</th>' .
            '        <th>' . 'Nota' . '</th>' .
            '        <th>' . 'Livro' . '</th>' .
            
            /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */
            '        <th>' . 'Leitor' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$titulo] . '</td>' .
                    '<td>' . $registro[$codigoBarras] . '</td>' .
                    '<td>' . $registro[$genero] . '</td>' .
                    '<td>' . $registro[$livro] . '</td>' .
                    /* TODO-4: Adicione a tabela os novos registros. */
                    '<td>' . $registro[$leitor] . '</td>';
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