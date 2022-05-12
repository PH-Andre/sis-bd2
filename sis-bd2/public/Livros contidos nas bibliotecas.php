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
        <h1>Livros contidos nas bibliotecas</h1>


        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'nome_biblioteca';
        $codigoBarras = 'Titulo';
    /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'select distinct nome_biblioteca, Titulo 
            from biblioteca_contem
            join livro on (biblioteca_contem.livro = livro.livro_id) 
            join biblioteca_leitor on (biblioteca_contem.biblioteca = biblioteca_leitor.id_biblioteca);'
            ;


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Nome Biblioteca' . '</th>' .
            '        <th>' . 'Livros adicionados' . '</th>' .
        
            
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