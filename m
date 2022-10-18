Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D2601E46
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Oct 2022 02:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666051738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lSLJs3nOFSke2axs9GggdkSYN3jG4FhVuq/wjOxMP5c=;
	b=Qd8jpFw5Znsh7UYrvJyuJE5EoZaaT/jHtc0qY1wyY7jBeC8g8CzVpCLACmoFFj8QlrGfqL
	b7Qu69vRxrHIUt3NcgarLkfmpVl+sOPTMiriq7MaYMflrkoXlcz730ntvM+YgIzVi7opkq
	d3QAywjvjCUtBsusOJM1DAGuNvHrdVk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-Fgs6h0FqNlOewy1mpoHOuw-1; Mon, 17 Oct 2022 20:08:55 -0400
X-MC-Unique: Fgs6h0FqNlOewy1mpoHOuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF73285A59D;
	Tue, 18 Oct 2022 00:08:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3FCA111D795;
	Tue, 18 Oct 2022 00:08:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 86E571946597;
	Tue, 18 Oct 2022 00:08:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 85C6B194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Oct 2022 00:08:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7248414657C8; Tue, 18 Oct 2022 00:08:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A3ED14657C7
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 00:08:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08DC8185A792
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 00:08:53 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-1iPrxG-eOl2enQYeaddEng-1; Mon, 17 Oct 2022 20:08:51 -0400
X-MC-Unique: 1iPrxG-eOl2enQYeaddEng-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4FF3B81BEB;
 Tue, 18 Oct 2022 00:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF651C433D6;
 Tue, 18 Oct 2022 00:08:47 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 17 Oct 2022 20:08:13 -0400
Message-Id: <20221018000839.2730954-4-sashal@kernel.org>
In-Reply-To: <20221018000839.2730954-1-sashal@kernel.org>
References: <20221018000839.2730954-1-sashal@kernel.org>
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
Subject: [Cluster-devel] [PATCH AUTOSEL 5.19 04/29] gfs2: Switch from
 strlcpy to strscpy
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
index c9b423c874a3..ba4dfef0c15d 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -383,8 +383,10 @@ static int init_names(struct gfs2_sbd *sdp, int silent=
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
@@ -1441,13 +1443,13 @@ static int gfs2_parse_param(struct fs_context *fc, =
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

