Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 001A41F3A68
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 14:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591704536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GfahbIapmS6yEpfYLq/uoLIQ3ED5C8RlnkthHQYoW54=;
	b=iJ7w6dam/sU5MQi1qQqDothfnM0qDwLs5wpTZzqeLR0WG45zhiVD/gVn+Rt0A1R8I87QZ3
	X4VlFYkoc5B/w7IiQdvZFhj6UZ5VueIZ0aQpdFL3HXXHz62fD/IfOr9VpLQ2AuapzjWS4q
	dRhqnY2Qdn/77uNERjKGp2A+jw+8cyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-WN4IFH3yNIm7MAF6vm8KDw-1; Tue, 09 Jun 2020 08:07:15 -0400
X-MC-Unique: WN4IFH3yNIm7MAF6vm8KDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32480A0BD9;
	Tue,  9 Jun 2020 12:07:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4313A89262;
	Tue,  9 Jun 2020 12:07:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCD7C1809547;
	Tue,  9 Jun 2020 12:07:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059C6DOU022932 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 08:06:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7CEF2156A4E; Tue,  9 Jun 2020 12:06:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4815C2156A4B
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 12:06:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FCCF800830
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 12:06:11 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-qyyAqZRJOwe5eq2OU-65kQ-1; Tue, 09 Jun 2020 08:06:04 -0400
X-MC-Unique: qyyAqZRJOwe5eq2OU-65kQ-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	059Burkw078737; Tue, 9 Jun 2020 12:06:03 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 31g33m4apt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 09 Jun 2020 12:06:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	059C3qxa196552; Tue, 9 Jun 2020 12:06:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 31gmqnhth5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 09 Jun 2020 12:06:03 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 059C61tn016990;
	Tue, 9 Jun 2020 12:06:02 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 09 Jun 2020 05:06:01 -0700
Date: Tue, 9 Jun 2020 15:05:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: agruenba@redhat.com
Message-ID: <20200609120555.GA52680@mwanda>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	bulkscore=0 mlxscore=0
	mlxlogscore=965 adultscore=0 spamscore=0 suspectscore=10 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2006090093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9646
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=10
	adultscore=0
	spamscore=0 cotscore=-2147483648 malwarescore=0 phishscore=0 mlxscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 priorityscore=1501
	mlxlogscore=998 bulkscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006090092
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [bug report] gfs2: Move inode generation number
 check into gfs2_inode_lookup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Andreas Gruenbacher,

The patch b66648ad6dcf: "gfs2: Move inode generation number check
into gfs2_inode_lookup" from Jan 15, 2020, leads to the following
static checker warning:

	fs/gfs2/inode.c:227 gfs2_inode_lookup()
	warn: passing zero to 'ERR_PTR'

fs/gfs2/inode.c
   112   * If @type is DT_UNKNOWN, the inode type is fetched from disk.
   113   *
   114   * If @blktype is anything other than GFS2_BLKST_FREE (which is used as a
   115   * placeholder because it doesn't otherwise make sense), the on-disk block type
   116   * is verified to be @blktype.
   117   *
   118   * When @no_formal_ino is non-zero, this function will return ERR_PTR(-ESTALE)
   119   * if it detects that @no_formal_ino doesn't match the actual inode generation
   120   * number.  However, it doesn't always know unless @type is DT_UNKNOWN.
   121   *
   122   * Returns: A VFS inode, or an error
                    ^^^^^^^^^^^^^^^^^^^^^^^^
The comments imply this does not return NULL.

   123   */
   124  
   125  struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
   126                                  u64 no_addr, u64 no_formal_ino,
   127                                  unsigned int blktype)
   128  {
   129          struct inode *inode;
   130          struct gfs2_inode *ip;
   131          struct gfs2_glock *io_gl = NULL;
   132          struct gfs2_holder i_gh;
   133          int error;
   134  
   135          gfs2_holder_mark_uninitialized(&i_gh);
   136          inode = gfs2_iget(sb, no_addr);
   137          if (!inode)
   138                  return ERR_PTR(-ENOMEM);
   139  
   140          ip = GFS2_I(inode);
   141  
   142          if (inode->i_state & I_NEW) {
                    ^^^^^^^^^^^^^^^^^^^^^^
We take this path.

   143                  struct gfs2_sbd *sdp = GFS2_SB(inode);
   144  
   145                  error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
   146                  if (unlikely(error))
   147                          goto fail;
   148                  flush_delayed_work(&ip->i_gl->gl_work);
   149  
   150                  error = gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
   151                  if (unlikely(error))
   152                          goto fail;
   153  
   154                  if (type == DT_UNKNOWN || blktype != GFS2_BLKST_FREE) {
   155                          /*
   156                           * The GL_SKIP flag indicates to skip reading the inode
   157                           * block.  We read the inode with gfs2_inode_refresh
   158                           * after possibly checking the block type.
   159                           */
   160                          error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE,
   161                                                     GL_SKIP, &i_gh);
   162                          if (error)
   163                                  goto fail;
   164  
   165                          error = -ESTALE;
   166                          if (no_formal_ino &&
   167                              gfs2_inode_already_deleted(ip->i_gl, no_formal_ino))
   168                                  goto fail;
   169  
   170                          if (blktype != GFS2_BLKST_FREE) {
   171                                  error = gfs2_check_blk_type(sdp, no_addr,
   172                                                              blktype);
   173                                  if (error)
   174                                          goto fail;
   175                          }
   176                  }
   177  
   178                  glock_set_object(ip->i_gl, ip);
   179                  set_bit(GIF_INVALID, &ip->i_flags);
   180                  error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
   181                  if (unlikely(error))
   182                          goto fail;
   183                  gfs2_cancel_delete_work(ip->i_iopen_gh.gh_gl);
   184                  glock_set_object(ip->i_iopen_gh.gh_gl, ip);
   185                  gfs2_glock_put(io_gl);
   186                  io_gl = NULL;
   187  
   188                  /* Lowest possible timestamp; will be overwritten in gfs2_dinode_in. */
   189                  inode->i_atime.tv_sec = 1LL << (8 * sizeof(inode->i_atime.tv_sec) - 1);
   190                  inode->i_atime.tv_nsec = 0;
   191  
   192                  if (type == DT_UNKNOWN) {
   193                          /* Inode glock must be locked already */
   194                          error = gfs2_inode_refresh(GFS2_I(inode));
   195                          if (error)
   196                                  goto fail;
   197                  } else {
   198                          ip->i_no_formal_ino = no_formal_ino;
   199                          inode->i_mode = DT2IF(type);
   200                  }
   201  
   202                  if (gfs2_holder_initialized(&i_gh))
   203                          gfs2_glock_dq_uninit(&i_gh);
   204  
   205                  gfs2_set_iop(inode);
   206          }
   207  
   208          if (no_formal_ino && ip->i_no_formal_ino &&
   209              no_formal_ino != ip->i_no_formal_ino) {
   210                  if (inode->i_state & I_NEW)
   211                          goto fail;
                                ^^^^^^^^^
"error" is zero here.

   212                  iput(inode);
   213                  return ERR_PTR(-ESTALE);
   214          }
   215  
   216          if (inode->i_state & I_NEW)
   217                  unlock_new_inode(inode);
   218  
   219          return inode;
   220  
   221  fail:
   222          if (io_gl)
   223                  gfs2_glock_put(io_gl);
   224          if (gfs2_holder_initialized(&i_gh))
   225                  gfs2_glock_dq_uninit(&i_gh);
   226          iget_failed(inode);
   227          return ERR_PTR(error);
                               ^^^^^
Leading to a NULL return.  It doesn't look like the caller checks for
NULL so it might lead to an Oops.

   228  }

regards,
dan carpenter

