#!/bin/sh

OPTIONS="--i=100 --src=randomize --num-gpus=4 --quick"
SUFFIX="default.gtx480.4x"

for i in audikw1.graph cage15.graph coPapersCiteseer.graph kkt_power.graph kron_g500-logn20.graph 
do
	echo ./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS  
	./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS > eval/$i.$SUFFIX.txt
	sleep 5 
	echo ./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --mark-parents
	./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --mark-parents > eval/$i.$SUFFIX.parent.txt 
	sleep 5 
done

for i in europe.osm.graph hugebubbles-00020.graph
do
	echo ./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10
	./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10 > eval/$i.$SUFFIX.txt 
	sleep 5 
	echo ./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10 --mark-parents
	./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10 --mark-parents > eval/$i.$SUFFIX.parent.txt 
	sleep 5 
done

for i in nlpkkt160.graph
do
	echo ./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10
	./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10 > eval/$i.$SUFFIX.txt 
	sleep 5 
	echo ./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10 --mark-parents
	./bin/test_bfs_4.0_x86_64 metis ../../../graphs/$i $OPTIONS --queue-sizing=0.10 --mark-parents > eval/$i.$SUFFIX.parent.txt 
	sleep 5 
done

for i in wikipedia-20070206.mtx
do
	echo ./bin/test_bfs_4.0_x86_64 market ../../../graphs/$i $OPTIONS 
	./bin/test_bfs_4.0_x86_64 market ../../../graphs/$i $OPTIONS > eval/$i.$SUFFIX.txt 
	sleep 5 
	echo ./bin/test_bfs_4.0_x86_64 market ../../../graphs/$i $OPTIONS --mark-parents
	./bin/test_bfs_4.0_x86_64 market ../../../graphs/$i $OPTIONS --mark-parents > eval/$i.$SUFFIX.parent.txt 
	sleep 5 
done

echo /bin/test_bfs_4.0_x86_64 grid2d 5000 --queue-sizing=0.15 $OPTIONS 
./bin/test_bfs_4.0_x86_64 grid2d 5000 --queue-sizing=0.15 $OPTIONS > eval/grid2d.5000.$SUFFIX.txt	
	sleep 5 
echo /bin/test_bfs_4.0_x86_64 grid2d 5000 --queue-sizing=0.15 $OPTIONS --mark-parents 
./bin/test_bfs_4.0_x86_64 grid2d 5000 --queue-sizing=0.15 $OPTIONS --mark-parents > eval/grid2d.5000.$SUFFIX.parent.txt	
	sleep 5 

echo /bin/test_bfs_4.0_x86_64 grid3d 300 --queue-sizing=0.15 $OPTIONS 
./bin/test_bfs_4.0_x86_64 grid3d 300 --queue-sizing=0.15 $OPTIONS > eval/grid3d.300.$SUFFIX.txt	
	sleep 5 
echo /bin/test_bfs_4.0_x86_64 grid3d 300 --queue-sizing=0.15 $OPTIONS --mark-parents 
./bin/test_bfs_4.0_x86_64 grid3d 300 --queue-sizing=0.15 $OPTIONS --mark-parents > eval/grid3d.300.$SUFFIX.parent.txt	
	sleep 5 

i=random.2Mv.128Me.gr
echo ./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS 
./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS > eval/$i.$SUFFIX.txt 
	sleep 5 
echo ./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS --mark-parents 
./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS --mark-parents > eval/$i.$SUFFIX.parent.txt 
	sleep 5 
 
i=rmat.2Mv.128Me.gr
echo ./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS 
./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS > eval/$i.$SUFFIX.txt 
	sleep 5 
echo ./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS --mark-parents 
./bin/test_bfs_4.0_x86_64 dimacs ../../../graphs/$i $OPTIONS --mark-parents > eval/$i.$SUFFIX.parent.txt
	sleep 5 
