Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCE5995F5
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Aug 2022 09:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660894023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BALyYlyUXRW32cza2MU6Q1Wj8Db/ELd+XO36iFON2lY=;
	b=c/Ms2rWU2wVBtkCfPomYtLp3yqBk4ihRtnh8rIISfiWBaM0FndR11ep5NhB4iHe0htZYd0
	oNjbocNdsfa0w4Nu2F/qqH78Y3+1e4ODthUSYHTeDB1d5jZR2FEI8PlbR83ihx5MrUYot0
	/Fel/sYRBNlTbbPBgEJ1OLlURMroFWY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-j4Dyq9aEPWabD2d046tHCw-1; Fri, 19 Aug 2022 03:27:00 -0400
X-MC-Unique: j4Dyq9aEPWabD2d046tHCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A1AD85A585;
	Fri, 19 Aug 2022 07:26:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA6682166B29;
	Fri, 19 Aug 2022 07:26:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53C92195354E;
	Fri, 19 Aug 2022 07:26:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 95516194F4B4 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 21:19:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 867B71121315; Thu, 18 Aug 2022 21:19:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82FE81121314
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 21:19:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CBB33C025C1
 for <cluster-devel@redhat.com>; Thu, 18 Aug 2022 21:19:58 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-44-jZAYxnc3Na6HjCY1DzVIpw-1; Thu,
 18 Aug 2022 17:19:55 -0400
X-MC-Unique: jZAYxnc3Na6HjCY1DzVIpw-1
Received: (qmail 3962329 invoked from network); 18 Aug 2022 23:01:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 18 Aug 2022 23:01:45 +0200
X-UD-Smtp-Session: l3s3148p1@BeP5SYrmgoMucref
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 18 Aug 2022 23:01:44 +0200
Message-Id: <20220818210144.7915-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Fri, 19 Aug 2022 07:26:55 +0000
Subject: [Cluster-devel] [PATCH] gfs2: move from strlcpy with unused retval
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Follow the advice of the below link and prefer 'strscpy' in this
subsystem. Conversion is 1:1 because the return value is not used.
Generated by a coccinelle script.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 fs/gfs2/ops_fstype.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 549879929c84..b57d9bf4b123 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -381,8 +381,8 @@ static int init_names(struct gfs2_sbd *sdp, int silent)
 	if (!table[0])
 		table = sdp->sd_vfs->s_id;
 
-	strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
-	strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
+	strscpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
+	strscpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
 
 	table = sdp->sd_table_name;
 	while ((table = strchr(table, '/')))
@@ -1439,13 +1439,13 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 
 	switch (o) {
 	case Opt_lockproto:
-		strlcpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
+		strscpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
 		break;
 	case Opt_locktable:
-		strlcpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
+		strscpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
 		break;
 	case Opt_hostdata:
-		strlcpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
+		strscpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
 		break;
 	case Opt_spectator:
 		args->ar_spectator = 1;
-- 
2.35.1

