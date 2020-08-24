Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E951225015B
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Aug 2020 17:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598283844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=exyYqFdSkk/gbGiBfi+b/ePciH+upeGalJuf85f2VH0=;
	b=aty/BpQifKeF+sBixi1zzzBJJYML53zx0jiwfngllGS21jpTw4T4XyRt2sLl5jWKsb3Err
	iNlrtSiKYOwui1ZRThQgpXpbPj5YONvQOaGglu1BV3p8lxOBmdnNA9o4W7iiEpLq40x7SL
	SBw86z1DISXrGCyc5mheJQuR0j95wV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-G135Ub98MK-6E7v9Q6Pspg-1; Mon, 24 Aug 2020 11:44:02 -0400
X-MC-Unique: G135Ub98MK-6E7v9Q6Pspg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 405DB81F010;
	Mon, 24 Aug 2020 15:44:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B7C5D9E2;
	Mon, 24 Aug 2020 15:43:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67E656690B;
	Mon, 24 Aug 2020 15:43:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07OFfpt2028837 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 11:41:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 40F1A5D9E4; Mon, 24 Aug 2020 15:41:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B84F5D9E2
	for <cluster-devel@redhat.com>; Mon, 24 Aug 2020 15:41:48 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 115E7668E0;
	Mon, 24 Aug 2020 15:41:48 +0000 (UTC)
Date: Mon, 24 Aug 2020 11:41:47 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <960332993.13813917.1598283707743.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200824104425.GB1793@kadam>
References: <20200824104425.GB1793@kadam>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.245, 10.4.195.7]
Thread-Topic: fs/gfs2/super.c:1458 gfs2_evict_inode() error: uninitialized
	symbol 'error'.
Thread-Index: 98LayT3LwrmUcR7agqSNwQngROS38g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild@lists.01.org, kbuild-all@lists.01.org,
	lkp@intel.com
Subject: Re: [Cluster-devel] [gfs2:for-next.bob6m 5/11] fs/gfs2/super.c:1458
 gfs2_evict_inode() error: uninitialized symbol 'error'.
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
> for-next.bob6m
> head:   fd5ce905071cc34294900a21a773d9f8c72f5119
> commit: e7450d984b481c3174f7c69b1e5662150309a9b4 [5/11] gfs2: Calculate
> number of revokes during evict
> config: i386-randconfig-m021-20200820 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> fs/gfs2/super.c:1458 gfs2_evict_inode() error: uninitialized symbol 'error'.
> 
> #
> https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=e7450d984b481c3174f7c69b1e5662150309a9b4
> git remote add gfs2
> https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
> git fetch --no-tags gfs2 for-next.bob6m
> git checkout e7450d984b481c3174f7c69b1e5662150309a9b4
> vim +/error +1458 fs/gfs2/super.c
> 
> d5c1515cf374951 Al Viro             2010-06-07  1332  static void
> gfs2_evict_inode(struct inode *inode)
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1333  {
> 001e8e8df4283dd Steven Whitehouse   2011-03-30  1334  	struct super_block *sb
> = inode->i_sb;
> 001e8e8df4283dd Steven Whitehouse   2011-03-30  1335  	struct gfs2_sbd *sdp =
> sb->s_fs_info;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1336  	struct gfs2_inode *ip
> = GFS2_I(inode);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1337  	struct gfs2_holder gh;
> ee530beafeca982 Bob Peterson        2015-12-07  1338  	struct address_space
> *metamapping;
> e7450d984b481c3 Bob Peterson        2020-08-12  1339  	int nr_revokes;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1340  	int error;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1341
> 059788039f1e634 Abhi Das            2014-03-31  1342  	if
> (test_bit(GIF_FREE_VFS_INODE, &ip->i_flags)) {
> 059788039f1e634 Abhi Das            2014-03-31  1343  		clear_inode(inode);
> 059788039f1e634 Abhi Das            2014-03-31  1344  		return;
> 059788039f1e634 Abhi Das            2014-03-31  1345  	}
> 059788039f1e634 Abhi Das            2014-03-31  1346
> bc98a42c1f7d0f8 David Howells       2017-07-17  1347  	if (inode->i_nlink ||
> sb_rdonly(sb))
> d5c1515cf374951 Al Viro             2010-06-07  1348  		goto out;
> d5c1515cf374951 Al Viro             2010-06-07  1349
> e0b62e21b71bbe6 Andreas Gruenbacher 2017-06-30  1350  	if
> (test_bit(GIF_ALLOC_FAILED, &ip->i_flags)) {
> e0b62e21b71bbe6 Andreas Gruenbacher 2017-06-30  1351
> 		BUG_ON(!gfs2_glock_is_locked_by_me(ip->i_gl));
> e0b62e21b71bbe6 Andreas Gruenbacher 2017-06-30  1352
> 		gfs2_holder_mark_uninitialized(&gh);
> 8c7b9262a860763 Andreas Gruenbacher 2020-01-13  1353  		goto out_delete;
> 
> From this goto
> 
> e0b62e21b71bbe6 Andreas Gruenbacher 2017-06-30  1354  	}
> e0b62e21b71bbe6 Andreas Gruenbacher 2017-06-30  1355
> 8c7b9262a860763 Andreas Gruenbacher 2020-01-13  1356  	if
> (test_bit(GIF_DEFERRED_DELETE, &ip->i_flags))
> 8c7b9262a860763 Andreas Gruenbacher 2020-01-13  1357  		goto out;
> 8c7b9262a860763 Andreas Gruenbacher 2020-01-13  1358
> 6a1c8f6dcf815d9 Andreas Gruenbacher 2017-08-01  1359  	/* Deletes should
> never happen under memory pressure anymore.  */
> 6a1c8f6dcf815d9 Andreas Gruenbacher 2017-08-01  1360  	if
> (WARN_ON_ONCE(current->flags & PF_MEMALLOC))
> 6a1c8f6dcf815d9 Andreas Gruenbacher 2017-08-01  1361  		goto out;
> 6a1c8f6dcf815d9 Andreas Gruenbacher 2017-08-01  1362
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1363  	/* Must not read inode
> block until block type has been verified */
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1364  	error =
> gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1365  	if (unlikely(error)) {
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1366
> 		glock_clear_object(ip->i_iopen_gh.gh_gl, ip);
> a6a4d98b0124b5d Bob Peterson        2013-05-29  1367
> 		ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
> d4da31986c5da14 Andreas Gruenbacher 2017-02-22  1368
> 		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1369  		goto out;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1370  	}
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1371
> f286d627ef026a4 Andreas Gruenbacher 2020-01-13  1372  	if
> (gfs2_inode_already_deleted(ip->i_gl, ip->i_no_formal_ino))
> f286d627ef026a4 Andreas Gruenbacher 2020-01-13  1373  		goto out_truncate;
> acf7e2444acfaf4 Steven Whitehouse   2009-09-08  1374  	error =
> gfs2_check_blk_type(sdp, ip->i_no_addr, GFS2_BLKST_UNLINKED);
> acf7e2444acfaf4 Steven Whitehouse   2009-09-08  1375  	if (error)
> acf7e2444acfaf4 Steven Whitehouse   2009-09-08  1376  		goto out_truncate;
> acf7e2444acfaf4 Steven Whitehouse   2009-09-08  1377
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1378  	if
> (test_bit(GIF_INVALID, &ip->i_flags)) {
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1379  		error =
> gfs2_inode_refresh(ip);
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1380  		if (error)
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1381  			goto out_truncate;
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1382  	}
> 44ad37d69b2cc42 Bob Peterson        2011-03-17  1383
> 71c1b2136835c88 Andreas Gruenbacher 2017-08-01  1384  	/*
> 71c1b2136835c88 Andreas Gruenbacher 2017-08-01  1385  	 * The inode may have
> been recreated in the meantime.
> 71c1b2136835c88 Andreas Gruenbacher 2017-08-01  1386  	 */
> 71c1b2136835c88 Andreas Gruenbacher 2017-08-01  1387  	if (inode->i_nlink)
> 71c1b2136835c88 Andreas Gruenbacher 2017-08-01  1388  		goto out_truncate;
> 71c1b2136835c88 Andreas Gruenbacher 2017-08-01  1389
> 8c7b9262a860763 Andreas Gruenbacher 2020-01-13  1390  out_delete:
> 6df9f9a253c7dc9 Andreas Gruenbacher 2016-06-17  1391  	if
> (gfs2_holder_initialized(&ip->i_iopen_gh) &&
> 7508abc4bdac43d Bob Peterson        2015-12-18  1392
> 	    test_bit(HIF_HOLDER, &ip->i_iopen_gh.gh_iflags)) {
> 9e73330f298acf5 Andreas Gruenbacher 2020-01-14  1393  		if
> (!gfs2_upgrade_iopen_glock(inode)) {
> 9e73330f298acf5 Andreas Gruenbacher 2020-01-14  1394
> 			gfs2_holder_uninit(&ip->i_iopen_gh);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1395  			goto out_truncate;
> 
> And this goto
> 
> 7508abc4bdac43d Bob Peterson        2015-12-18  1396  		}
> 9e73330f298acf5 Andreas Gruenbacher 2020-01-14  1397  	}
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1398
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1399  	if
> (S_ISDIR(inode->i_mode) &&
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1400  	    (ip->i_diskflags &
> GFS2_DIF_EXHASH)) {
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1401  		error =
> gfs2_dir_exhash_dealloc(ip);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1402  		if (error)
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1403  			goto out_unlock;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1404  	}
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1405
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1406  	if (ip->i_eattr) {
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1407  		error =
> gfs2_ea_dealloc(ip);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1408  		if (error)
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1409  			goto out_unlock;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1410  	}
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1411
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1412  	if
> (!gfs2_is_stuffed(ip)) {
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1413  		error =
> gfs2_file_dealloc(ip);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1414  		if (error)
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1415  			goto out_unlock;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1416  	}
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1417
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1418  	/* We're about to
> clear the bitmap for the dinode, but as soon as we
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1419  	   do,
> gfs2_create_inode can create another inode at the same block
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1420  	   location and try to
> set gl_object again. We clear gl_object here so
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1421  	   that subsequent
> inode creates don't see an old gl_object. */
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1422
> 	glock_clear_object(ip->i_gl, ip);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1423  	error =
> gfs2_dinode_dealloc(ip);
> f286d627ef026a4 Andreas Gruenbacher 2020-01-13  1424
> 	gfs2_inode_remember_delete(ip->i_gl, ip->i_no_formal_ino);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1425  	goto out_unlock;
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1426
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1427  out_truncate:
> 805c090750a315c Bob Peterson        2018-01-08  1428  	gfs2_log_flush(sdp,
> ip->i_gl, GFS2_LOG_HEAD_FLUSH_NORMAL |
> 805c090750a315c Bob Peterson        2018-01-08  1429
> 		       GFS2_LFC_EVICT_INODE);
> ee530beafeca982 Bob Peterson        2015-12-07  1430  	metamapping =
> gfs2_glock2aspace(ip->i_gl);
> 2216db70c95a961 Benjamin Marzinski  2012-09-20  1431  	if
> (test_bit(GLF_DIRTY, &ip->i_gl->gl_flags)) {
> 2216db70c95a961 Benjamin Marzinski  2012-09-20  1432
> 		filemap_fdatawrite(metamapping);
> 2216db70c95a961 Benjamin Marzinski  2012-09-20  1433
> 		filemap_fdatawait(metamapping);
> 2216db70c95a961 Benjamin Marzinski  2012-09-20  1434  	}
> 40ac218f52aa5ca Steven Whitehouse   2011-08-02  1435  	write_inode_now(inode,
> 1);
> b5b24d7aeb96089 Steven Whitehouse   2011-09-07  1436
> 	gfs2_ail_flush(ip->i_gl, 0);
> 40ac218f52aa5ca Steven Whitehouse   2011-08-02  1437
> e7450d984b481c3 Bob Peterson        2020-08-12  1438  	nr_revokes =
> inode->i_mapping->nrpages + metamapping->nrpages;
> e7450d984b481c3 Bob Peterson        2020-08-12  1439  	if (!nr_revokes)
> e7450d984b481c3 Bob Peterson        2020-08-12  1440  		goto out_unlock;
> 
> To this goto
> 
> e7450d984b481c3 Bob Peterson        2020-08-12  1441
> e7450d984b481c3 Bob Peterson        2020-08-12  1442  	error =
> gfs2_trans_begin(sdp, 0, nr_revokes);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1443  	if (error)
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1444  		goto out_unlock;
> 380f7c65a7eb328 Steven Whitehouse   2011-07-14  1445  	/* Needs to be done
> before glock release & also in a transaction */
> 380f7c65a7eb328 Steven Whitehouse   2011-07-14  1446
> 	truncate_inode_pages(&inode->i_data, 0);
> ee530beafeca982 Bob Peterson        2015-12-07  1447
> 	truncate_inode_pages(metamapping, 0);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1448  	gfs2_trans_end(sdp);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1449
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1450  out_unlock:
> a097dc7e24cba79 Bob Peterson        2015-07-16  1451  	if
> (gfs2_rs_active(&ip->i_res))
> a097dc7e24cba79 Bob Peterson        2015-07-16  1452
> 		gfs2_rs_deltree(&ip->i_res);
> 8e2e00473598dd5 Bob Peterson        2012-07-19  1453
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1454  	if
> (gfs2_holder_initialized(&gh)) {
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1455
> 		glock_clear_object(ip->i_gl, ip);
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22  1456
> 		gfs2_glock_dq_uninit(&gh);
> 240c6235dfe4fe4 Bob Peterson        2017-07-18  1457  	}
> 9e6e0a128bca0a1 Steven Whitehouse   2009-05-22 @1458  	if (error && error !=
> GLR_TRYFAILED && error != -EROFS)
>                                                             ^^^^^
> Potentially uninitialized?

Hi,

Thanks. This is now fixed in the for-next.bob6n branch.

Regards,

Bob Peterson

