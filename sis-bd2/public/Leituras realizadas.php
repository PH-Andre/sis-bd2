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
        $livro = 'Titulo';
        $leitor ='leitor_nome';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'select inicio_leitura, final_leitura, classificacao_livro,  Titulo , leitor_nome from leitura_efetivadas join livro on (leitura_efetivadas.leitura_livro = livro.livro_id) join leitor on (leitura_efetivadas.leitura_leitor = leitor.leitor_ID);'
            ;


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