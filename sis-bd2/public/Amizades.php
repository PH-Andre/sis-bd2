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
        <h1>Amizades</h1>


        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'leitor1';
        $codigoBarras = 'leitor2';
        
        
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'select leitor.leitor_nome leitor1, l2.leitor_nome leitor2
            from amizade_leitor
            inner join leitor on (amizade_leitor.leitor_1 = leitor.leitor_ID )
            inner join leitor l2 on l2.leitor_ID = amizade_leitor.leitor2;';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'O leitor' . '</th>' .
            '        <th>' . '    é amigo de:' . '</th>' .
            /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */
         
            
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$titulo] . '</td>' .
                    '<td>' . $registro[$codigoBarras] . '</td>' ;
                    /* TODO-4: Adicione a tabela os novos registros. */
                
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