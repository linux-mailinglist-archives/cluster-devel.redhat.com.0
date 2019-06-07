Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FE39437
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Jun 2019 20:24:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D620C3082128;
	Fri,  7 Jun 2019 18:23:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD36C7F322;
	Fri,  7 Jun 2019 18:23:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA9C0206D2;
	Fri,  7 Jun 2019 18:23:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57INVAZ005053 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 14:23:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DEBC1001B30; Fri,  7 Jun 2019 18:23:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A50110AFE98;
	Fri,  7 Jun 2019 18:23:28 +0000 (UTC)
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09698307D854;
	Fri,  7 Jun 2019 18:23:13 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id v193so5155329itc.0;
	Fri, 07 Jun 2019 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GvSp4gzCgfrFcDrCwilhUDsCbSpdZAD9u0QzYjvDaf0=;
	b=PC+YMhuNaUWAWX/Lb0gLc/h+nxONJn2eHx5nbhURAcSpznHVvBeFqIXMfnhC1abY8A
	qZFVchyCFcRgRrxaNFVSL3yEE6P3zQOzLX/Q7XOspBhW4rlIiSNHcxw2oEp5ow4AJf70
	Wmhwyawxz6Yomksl10z9bCZn3o0SKde3GlZPVVO9rJQwWpttLFwExpM2j4T1MJ5KZtfU
	F32W3ZllSKXC5YJ+x3xp4eWCY86Kh0xK/SKp+aEp941V26weYBRni6CmgtX8lPPveuwq
	DfvQNv4RbGb6b+TUB/Ba2AQt01HqIcVUN0JMLz53VREhNvCTawEcfP3d13fEwamIFAtC
	63OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GvSp4gzCgfrFcDrCwilhUDsCbSpdZAD9u0QzYjvDaf0=;
	b=YNLo3cDR5tT0QM3cJH/qvIBm8Iklhk5CeDdunZq0gEGDHk3rF0u7vo1ZfvSQPMIucW
	7D/ebWTMYjlk18Zy6U0eiezUrGMaj7q16zJcNmGncHuO5m/wZW2nLeYFetJu8CETERzJ
	oQdj5U8EYOY9xIWiismRK60UK+wwnm+PBP0X03+5dWhdcdlOXWYfqQiTNoGlg0Nq3Ze6
	5dm1oWbD/3TESCMl52DkvgbeoVSiOUjaYpubP+VZf96xnVMJSHU1sucGchXokAYsuuek
	GcIX7u7YuXgfpqELWTMMJu0uOLMKtp/SzbQI2cinJOm+8JfqfFuoJj+I4RxRy+sUFdse
	MJHw==
X-Gm-Message-State: APjAAAVSxUTYwOoAs+eEFTOiv3h5diOJVsfw83AxDW+N52ZkEB6pJ91B
	DPfKk7f8FUnnDhCPYp7J440=
X-Google-Smtp-Source: APXvYqzA4g8acCxIswuZ9Kdgg+3nVinuOJqNEcoCUuLrDB31N619AeKy0ZE0kjyTNwf1GzC2Gy+EUA==
X-Received: by 2002:a02:9143:: with SMTP id b3mr12666954jag.12.1559931792333; 
	Fri, 07 Jun 2019 11:23:12 -0700 (PDT)
Received: from ubu (2600-6c48-437f-c81d-59ab-a761-9e83-29ee.dhcp6.chtrptr.net.
	[2600:6c48:437f:c81d:59ab:a761:9e83:29ee])
	by smtp.gmail.com with ESMTPSA id
	d129sm1364143ita.36.2019.06.07.11.23.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Jun 2019 11:23:11 -0700 (PDT)
From: Kimberly Brown <kimbrownkd@gmail.com>
To: rpeterso@redhat.com, agruenba@redhat.com, gregkh@linuxfoundation.org
Date: Fri,  7 Jun 2019 14:23:00 -0400
Message-Id: <20190607182300.32457-1-kimbrownkd@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 07 Jun 2019 18:23:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 07 Jun 2019 18:23:13 +0000 (UTC) for IP:'209.85.166.195'
	DOMAIN:'mail-it1-f195.google.com'
	HELO:'mail-it1-f195.google.com' FROM:'kimbrownkd@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.195 mail-it1-f195.google.com 209.85.166.195
	mail-it1-f195.google.com <kimbrownkd@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: replace ktype default_attrs with
	default_groups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 07 Jun 2019 18:24:05 +0000 (UTC)

The kobj_type default_attrs field is being replaced by the
default_groups field. Replace the default_attrs field in gfs2_ktype
with default_groups. Use the ATTRIBUTE_GROUPS macro to create
gfs2_groups.

Signed-off-by: Kimberly Brown <kimbrownkd@gmail.com>
---
 fs/gfs2/sys.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 348903010911..c784034d22a8 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -299,6 +299,7 @@ static struct attribute *gfs2_attrs[] = {
 	&gfs2_attr_demote_rq.attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(gfs2);
 
 static void gfs2_sbd_release(struct kobject *kobj)
 {
@@ -309,7 +310,7 @@ static void gfs2_sbd_release(struct kobject *kobj)
 
 static struct kobj_type gfs2_ktype = {
 	.release = gfs2_sbd_release,
-	.default_attrs = gfs2_attrs,
+	.default_groups = gfs2_groups,
 	.sysfs_ops     = &gfs2_attr_ops,
 };
 
-- 
2.17.1

