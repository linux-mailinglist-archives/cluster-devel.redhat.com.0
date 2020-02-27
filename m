Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA95171093
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Feb 2020 06:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582781957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ehwHaaATU7as8La+ibOxRJrlNJmB2ckuUUqjoIO/DGE=;
	b=fC3BXZy8vXXOFcQ3qoBvJgdwis7HqSnqWVN6VwMRfWobPTJyEf9nkeOYiM+kqUEEKtaRuM
	+nwd07TFzCiNSKyq89jQCCXwB7gw+eOLadPDLTT9nJXcjg9RabYpqmeKBGL/RzbUij6eDG
	DB6opAJHjjTBdx+Ncnc6lnyDW6biWkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-_jhdYqYFMB6o5zAPqZVqrQ-1; Thu, 27 Feb 2020 00:39:15 -0500
X-MC-Unique: _jhdYqYFMB6o5zAPqZVqrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262E31088381;
	Thu, 27 Feb 2020 05:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A0610027A4;
	Thu, 27 Feb 2020 05:39:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89A8A1809567;
	Thu, 27 Feb 2020 05:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01R5d1ST003151 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 00:39:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2C1A2166B29; Thu, 27 Feb 2020 05:39:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE4982166B28
	for <cluster-devel@redhat.com>; Thu, 27 Feb 2020 05:38:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B23A5185A78F
	for <cluster-devel@redhat.com>; Thu, 27 Feb 2020 05:38:59 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-yd96ReTqNyWfUAF6PIB_Zg-1; Thu, 27 Feb 2020 00:38:57 -0500
X-MC-Unique: yd96ReTqNyWfUAF6PIB_Zg-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01R5NodH184585; Thu, 27 Feb 2020 05:38:55 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 2ydybcjg52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2020 05:38:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01R5Mg8Z127368; Thu, 27 Feb 2020 05:38:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 2ydcsbfe01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2020 05:38:54 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01R5crYd015395;
	Thu, 27 Feb 2020 05:38:53 GMT
Received: from kili.mountain (/129.205.23.165)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 Feb 2020 21:38:52 -0800
Date: Thu, 27 Feb 2020 08:38:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: rpeterso@redhat.com
Message-ID: <20200227053842.4wthay5evgb4tlap@kili.mountain>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9543
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	phishscore=0 bulkscore=0
	spamscore=0 mlxlogscore=293 mlxscore=0 suspectscore=1 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002270039
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9543
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
	adultscore=0
	priorityscore=1501 suspectscore=1 mlxlogscore=350 lowpriorityscore=0
	phishscore=0 spamscore=0 clxscore=1011 malwarescore=0 mlxscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002270039
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01R5d1ST003151
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [bug report] gfs2: Force withdraw to replay
 journals and wait for it to finish
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello Bob Peterson,

This is a semi-automatic email about new static checker warnings.

The patch f4e8da521747: "gfs2: Force withdraw to replay journals and
wait for it to finish" from Jan 28, 2020, leads to the following
Smatch complaint:

    fs/gfs2/util.c:135 signal_our_withdraw()
     error: we previously assumed 'sdp->sd_vfs' could be null (see line 119=
)

fs/gfs2/util.c
   118=09=09clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
   119=09=09if (sdp->sd_vfs && !sb_rdonly(sdp->sd_vfs))
                    ^^^^^^^^^^^
Patch adds check

   120=09=09=09ret =3D gfs2_make_fs_ro(sdp);
   121=09
   122=09=09/*
   123=09=09 * Drop the glock for our journal so another node can recover i=
t.
   124=09=09 */
   125=09=09if (gfs2_holder_initialized(&sdp->sd_journal_gh)) {
   126=09=09=09gfs2_glock_dq_wait(&sdp->sd_journal_gh);
   127=09=09=09gfs2_holder_uninit(&sdp->sd_journal_gh);
   128=09=09}
   129=09=09sdp->sd_jinode_gh.gh_flags |=3D GL_NOCACHE;
   130=09=09gfs2_glock_dq(&sdp->sd_jinode_gh);
   131=09=09if (test_bit(SDF_FS_FROZEN, &sdp->sd_flags)) {
   132=09=09=09/* Make sure gfs2_unfreeze works if partially-frozen */
   133=09=09=09flush_workqueue(gfs2_freeze_wq);
   134=09=09=09atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
   135=09=09=09thaw_super(sdp->sd_vfs);
                        ^^^^^^^^^^^^^^^^^^^^^^^
And unchecked dereference as well inside the thaw_super() function.

   136=09=09} else {
   137=09=09=09wait_on_bit(&gl->gl_flags, GLF_DEMOTE, TASK_UNINTERRUPTIBLE)=
;

regards,
dan carpenter


