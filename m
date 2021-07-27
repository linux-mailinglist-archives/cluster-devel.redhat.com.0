Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE6E3D7C50
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 19:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627407448;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kff/hbC+Yrr+TUibuDEXz9XdDBjqqBEwdtFmX3A+8oQ=;
	b=Uex64NFeNlHye5fCMDz/gZGvpCE1x6cVNLqzBLj0PFynIedoElI6ZL2XdLxmIVnaJePDiB
	NjSeG8cJHQj3Hx9WHl6LsnZVP/MhgP+M+TTxphHT4XgyPo+jtDkcsuNAcEnRRw4fos86f7
	ehHQ1HLiSCLXPzp4pFUxijwpLrmMgNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-KnmFK6Z3P3mt3laAUXRn6g-1; Tue, 27 Jul 2021 13:37:26 -0400
X-MC-Unique: KnmFK6Z3P3mt3laAUXRn6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27E51802937;
	Tue, 27 Jul 2021 17:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A3F75FC03;
	Tue, 27 Jul 2021 17:37:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 081AF4A706;
	Tue, 27 Jul 2021 17:37:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RHbIrS022880 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 13:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99EE919630; Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-120.phx2.redhat.com [10.3.112.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BF67179B3
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 17:37:18 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Jul 2021 12:37:07 -0500
Message-Id: <20210727173709.210711-14-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
References: <20210727173709.210711-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 13/15] gfs2: ignore usr|grp|prjquota
	mount options
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, gfs2 rejected mounts attempted with the usrquota,
grpquota, or prjquota mount options. That caused numerous xfstests tests
to fail. This patch allows gfs2 to accept but ignore those mount options
so the tests may be run.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 8051f130cf53..69bdc2917fb5 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1373,6 +1373,7 @@ enum gfs2_param {
 	Opt_barrier,
 	Opt_rgrplvb,
 	Opt_loccookie,
+	Opt_ignore,
 };
 
 static const struct constant_table gfs2_param_quota[] = {
@@ -1431,6 +1432,9 @@ static const struct fs_parameter_spec gfs2_fs_parameters[] = {
 	/* quota can be a flag or an enum so it gets special treatment */
 	fsparam_flag_no("quota",	      Opt_quota_flag),
 	fsparam_enum("quota",		      Opt_quota, gfs2_param_quota),
+	fsparam_flag("usrquota",	      Opt_ignore),
+	fsparam_flag("grpquota",	      Opt_ignore),
+	fsparam_flag("prjquota",	      Opt_ignore),
 	{}
 };
 
@@ -1532,6 +1536,8 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_loccookie:
 		args->ar_loccookie = result.boolean;
 		break;
+	case Opt_ignore:
+		break;
 	default:
 		return invalfc(fc, "invalid mount option: %s", param->key);
 	}
-- 
2.31.1

