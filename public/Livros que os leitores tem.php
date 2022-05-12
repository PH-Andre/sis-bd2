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
        <h1>Livros que os leitores possuem</h1>


        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'leitor_nome';
        $codigoBarras = 'Titulo';
    /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'select distinct leitor_nome, Titulo 
            from possui 
            join livro on (possui.possui_livro_id_livro_FK = livro.livro_id) 
            join leitor on (possui.possui_leitor_id_FK = leitor.leitor_ID);'
            ;


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Nome Leitor' . '</th>' .
            '        <th>' . 'Livro possuido' . '</th>' .
        
            
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