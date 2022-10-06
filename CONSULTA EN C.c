//Incluir esta libreri??a para poder hacer las llamadas en shiva2.upc.es
//#include <my_global.h>
#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
int main(int argc, char **argv)
{
	MYSQL *conn;
	int err;
	// Estructura especial para almacenar resultados de consultas 
	MYSQL_RES *resultado;
	MYSQL_ROW row;
	
	//Creamos una conexion al servidor MYSQL 
	conn = mysql_init(NULL);
	if (conn==NULL) {
		printf ("Error al crear la conexi?n: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	//inicializar la conexin
	conn = mysql_real_connect (conn, "localhost","root", "mysql", "B18",0, NULL, 0);
	if (conn==NULL) {
		printf ("Error al inicializar la conexion: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	
	char partidas[20];
	// Pregunto los nombre de los dos jugadores
	printf ("Dame el numero de partidas\n"); 
	scanf ("%s", partidas);
	
	char consulta [80];
	strcpy (consulta,"SELECT Jugador.Nombre FROM JUGADOR,PUNTUACIÓN,PARTIDAS  WHERE  = '");
	strcat (consulta,partidas);
	strcat (consulta,"'AND JUGADOR.ID = PARTIDAS.ID_");
	
	err=mysql_query (conn, consulta);
	if (err!=0) {
		printf ("Error al consultar datos de la base %u %s\n",
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	
	
	row = mysql_fetch_row (resultado);
	
	if (row == NULL)
		printf ("No se han obtenido datos en la consulta\n");
	else
		while (row !=NULL) {
			
			printf ("%s\n", row[0]);
		
			row = mysql_fetch_row (resultado);
	}
		
		mysql_close (conn);
		exit(0);
}
