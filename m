Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 64C5F12F9DB
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578065502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZGSBTgAQdGDoGZgg4PcrAAthr0OtsA6HiRcgZw6KlDk=;
	b=axleeLJjz75oTfvrh0k68mpE7LdKYYtxkHn0VI5N4CVISO75Jw3VY+0c02RkvjmcrXEYRf
	BOMW5g7CRRjypDTzNqFZTqI2mE40yIlvkNL0V4GsJXJzznlGKKpMYPeqpPYOs5cfNuql8P
	yBkxb9tRSkzPRrOh/84vhIoJUs1/wS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-GtkGjUhrPv6ScYECoLsJhA-1; Fri, 03 Jan 2020 10:31:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFDB3107ACC5;
	Fri,  3 Jan 2020 15:31:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC0691081172;
	Fri,  3 Jan 2020 15:31:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94B5E820E4;
	Fri,  3 Jan 2020 15:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003FVSbg016214 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:31:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D95C07942E; Fri,  3 Jan 2020 15:31:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D82763BCA
	for <cluster-devel@redhat.com>; Fri,  3 Jan 2020 15:31:28 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  3 Jan 2020 09:31:23 -0600
Message-Id: <20200103153123.402971-7-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
References: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 6/6] gfs2: revoke cleanup:
	gfs2_trans_remove_revoke
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
X-MC-Unique: GtkGjUhrPv6ScYECoLsJhA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Several gfs2 functions failed to reserve enough revoke entries for their
transactions in the journal. Function gfs2_trans_remove_revoke unconditiona=
lly
decrements tr->tr_num_revoke, and if not enough revokes are reserved, the
value goes from 0 to  4294967295 (-1, but it's an unsigned int). This is la=
ter
re-added to the system-wide revoke numbers, thereby decrementing the value
(sd_log_commited_revoke) "properly," but by accident. This worked properly
most of the time because one transaction would reserve space for revokes,
then it would be merged with the system transaction (sdp->sd_log_tr) and it
usually did not run out, because you can hold a lot of revoke entries
per log descriptor block. Some of the code, such as gfs2_write_revokes, wou=
ld
work around this and somehow got it right most of the time. However, some
jdata tests with xfstests generic/269 encountered problems when it actually
ran out.

This patch is part of a series that tries to do proper accounting of revoke=
s.

This patch adds sanity checking for revoke counts to function
gfs2_trans_remove_revoke.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/trans.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 4d01fe19c125..07c2d2194a9b 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -261,10 +261,22 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u=
64 blkno, unsigned int len)
 =09=09=09list_del_init(&bd->bd_list);
 =09=09=09gfs2_assert_withdraw(sdp, sdp->sd_log_num_revoke);
 =09=09=09sdp->sd_log_num_revoke--;
-=09=09=09if (bd->bd_gl)
+=09=09=09if (bd->bd_gl) {
+=09=09=09=09sdp->sd_log_commited_revoke--;
 =09=09=09=09gfs2_glock_remove_revoke(bd->bd_gl);
+=09=09=09}
 =09=09=09kmem_cache_free(gfs2_bufdata_cachep, bd);
-=09=09=09tr->tr_num_revoke--;
+=09=09=09if (tr->tr_num_revoke)
+=09=09=09=09tr->tr_num_revoke--;
+=09=09=09else if (sdp->sd_log_tr &&
+=09=09=09=09 sdp->sd_log_tr->tr_num_revoke)
+=09=09=09=09sdp->sd_log_tr->tr_num_revoke--;
+=09=09=09else {
+=09=09=09=09fs_warn(sdp, "Removing a revoke that was not "
+=09=09=09=09=09"reserved! Please investigate.\n");
+=09=09=09=09gfs2_print_trans(sdp, tr);
+=09=09=09=09BUG();
+=09=09=09}
 =09=09=09if (--n =3D=3D 0)
 =09=09=09=09break;
 =09=09}
--=20
2.24.1

