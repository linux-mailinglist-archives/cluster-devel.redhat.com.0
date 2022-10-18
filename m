Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10268601E31
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Oct 2022 02:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666051683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gcBwxbhDOoZ6DHN3OCisWcIZGd352DbA7lttvgypjZY=;
	b=PNSW2s8gwvOrFhyoVojQbcY+3TgAgtyl+5QBAddcl9oydxnzibz3DDvz/Hr1I6kwWgaEAR
	OhfLb0R7KveEty4Vxq1vQcYTiOirBwcfKe82g3XmNK9RXSu/Y12aNvcTKbj5Q409VUrc6Z
	1xIhYaJ1vAonOwvgEB1mU7DLAd1hEtE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-kXCWmMSJPEqkY-_wHWLajA-1; Mon, 17 Oct 2022 20:07:59 -0400
X-MC-Unique: kXCWmMSJPEqkY-_wHWLajA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E669B85A5A6;
	Tue, 18 Oct 2022 00:07:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D0AB401D59;
	Tue, 18 Oct 2022 00:07:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 670A71946597;
	Tue, 18 Oct 2022 00:07:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 63CA1194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Oct 2022 00:07:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0D0B914657C7; Tue, 18 Oct 2022 00:07:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0542314657C5
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 00:07:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6B2D857F8F
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 00:07:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-f6wa_vWOPCKAqiIq3C3YpA-1; Mon, 17 Oct 2022 20:07:41 -0400
X-MC-Unique: f6wa_vWOPCKAqiIq3C3YpA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E19C861316;
 Tue, 18 Oct 2022 00:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB97C433D7;
 Tue, 18 Oct 2022 00:07:39 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 17 Oct 2022 20:07:01 -0400
Message-Id: <20221018000729.2730519-4-sashal@kernel.org>
In-Reply-To: <20221018000729.2730519-1-sashal@kernel.org>
References: <20221018000729.2730519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH AUTOSEL 6.0 04/32] gfs2: Switch from strlcpy
 to strscpy
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit 204c0300c4e99707e9fb6e57840aa1127060e63f ]

Switch from strlcpy to strscpy and make sure that @count is the size of
the smaller of the source and destination buffers.  This prevents
reading beyond the end of the source buffer when the source string isn't
null terminated.

Found by a modified version of syzkaller.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/ops_fstype.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 549879929c84..236b59ef93b6 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -381,8 +381,10 @@ static int init_names(struct gfs2_sbd *sdp, int silent=
)
 =09if (!table[0])
 =09=09table =3D sdp->sd_vfs->s_id;
=20
-=09strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
-=09strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
+=09BUILD_BUG_ON(GFS2_LOCKNAME_LEN > GFS2_FSNAME_LEN);
+
+=09strscpy(sdp->sd_proto_name, proto, GFS2_LOCKNAME_LEN);
+=09strscpy(sdp->sd_table_name, table, GFS2_LOCKNAME_LEN);
=20
 =09table =3D sdp->sd_table_name;
 =09while ((table =3D strchr(table, '/')))
@@ -1439,13 +1441,13 @@ static int gfs2_parse_param(struct fs_context *fc, =
struct fs_parameter *param)
=20
 =09switch (o) {
 =09case Opt_lockproto:
-=09=09strlcpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
+=09=09strscpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
 =09=09break;
 =09case Opt_locktable:
-=09=09strlcpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
+=09=09strscpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
 =09=09break;
 =09case Opt_hostdata:
-=09=09strlcpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
+=09=09strscpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
 =09=09break;
 =09case Opt_spectator:
 =09=09args->ar_spectator =3D 1;
--=20
2.35.1

