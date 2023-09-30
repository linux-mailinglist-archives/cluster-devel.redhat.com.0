Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DDD7B650C
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Oct 2023 11:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696324305;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GwKeB2GcV8X8HT4SX1MXoeR5H7ol3LfqqF5Xgl3DCSk=;
	b=ehpw7C5GxgNUUH97GHusTmtuIrne4EZ6tME5wLthnafXnpYX/qjaDcJP3tr9k4d6w3q6ED
	5dC7ruQQBxWppYcabTqWzujxyXeBwueYoYd9q5F/rL6XVNCzlkrIZD0jIIE60sjJGFdMoi
	5U9dLoMhpYTVVa2ICH0b0UoRNRGAoYk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-SJgkhAlaOjuw4J3whUWM5g-1; Tue, 03 Oct 2023 05:11:39 -0400
X-MC-Unique: SJgkhAlaOjuw4J3whUWM5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A94F71C07825;
	Tue,  3 Oct 2023 09:11:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E8BA40C2013;
	Tue,  3 Oct 2023 09:11:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4EF0219465A3;
	Tue,  3 Oct 2023 09:11:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 722251946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 30 Sep 2023 05:01:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 24A7D140E96D; Sat, 30 Sep 2023 05:01:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D241140E96C
 for <cluster-devel@redhat.com>; Sat, 30 Sep 2023 05:01:40 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3F761C0515E
 for <cluster-devel@redhat.com>; Sat, 30 Sep 2023 05:01:39 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-IxO23mnBP5SipNynbxF7vA-1; Sat, 30 Sep 2023 01:01:37 -0400
X-MC-Unique: IxO23mnBP5SipNynbxF7vA-1
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5859b2eaa67so1170156a12.0; 
 Fri, 29 Sep 2023 22:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696050096; x=1696654896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwKeB2GcV8X8HT4SX1MXoeR5H7ol3LfqqF5Xgl3DCSk=;
 b=KpawhCOokRC2SGbV0ZQ+6ggcYXOrsj7MqmPR/MAktNg12rtneiiRWWaVSkzXO4TN5F
 de/W97my//2CaJZ8JnbUK1cy+HLcTfWg7vGIRND1Qt5DuSlxFKE49QqmB1c8CgyvW11q
 5xQyDy293kxUowiTZGR5y20E+hUS1Z9srQg8JrK7qZyPfN9VShvbzo398dh88N1utLFg
 vo/1BemOHoq33YWxjVAEhFDUJTrDlxI4mdQTQqILwKHZjazWQYGBG66X7ZbuD7Xd94tr
 yFZq3zqkTbiqFZVpcu211XIFZUTnS2vLo5Cn5VZQZRgD8cHKohGrJ549q1/X188cgag7
 0UIQ==
X-Gm-Message-State: AOJu0Ywow4ysZgs/z1NxKhkogwaZ19vGWGEWyXhCCcz3UbMRHnGAaZC8
 6WZuHFjqKk+UgNsYvNqVkHY=
X-Google-Smtp-Source: AGHT+IEvarzPr/wanHw3WlffE8n4isOYDUaHmTBU4OusHr+SsPOQsgnsCDdcqx9c5xvYMHgnXwSeWg==
X-Received: by 2002:a17:903:456:b0:1c3:1c74:5d0a with SMTP id
 iw22-20020a170903045600b001c31c745d0amr5368060plb.34.1696050096054; 
 Fri, 29 Sep 2023 22:01:36 -0700 (PDT)
Received: from wedsonaf-dev.home.lan ([189.124.190.154])
 by smtp.googlemail.com with ESMTPSA id
 y10-20020a17090322ca00b001c322a41188sm392136plg.117.2023.09.29.22.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 22:01:35 -0700 (PDT)
From: Wedson Almeida Filho <wedsonaf@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Date: Sat, 30 Sep 2023 02:00:16 -0300
Message-Id: <20230930050033.41174-13-wedsonaf@gmail.com>
In-Reply-To: <20230930050033.41174-1-wedsonaf@gmail.com>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 03 Oct 2023 09:11:34 +0000
Subject: [Cluster-devel] [PATCH 12/29] gfs2: move gfs2_xattr_handlers_max to
 .rodata
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 Wedson Almeida Filho <walmeida@microsoft.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Wedson Almeida Filho <walmeida@microsoft.com>

This makes it harder for accidental or malicious changes to
gfs2_xattr_handlers_max at runtime.

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
---
 fs/gfs2/super.h | 4 ++--
 fs/gfs2/xattr.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index bba58629bc45..3555dc69183a 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -59,8 +59,8 @@ extern const struct export_operations gfs2_export_ops;
 extern const struct super_operations gfs2_super_ops;
 extern const struct dentry_operations gfs2_dops;
 
-extern const struct xattr_handler *gfs2_xattr_handlers_max[];
-extern const struct xattr_handler **gfs2_xattr_handlers_min;
+extern const struct xattr_handler * const gfs2_xattr_handlers_max[];
+extern const struct xattr_handler * const *gfs2_xattr_handlers_min;
 
 #endif /* __SUPER_DOT_H__ */
 
diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 93b36d026bb4..146c32d44bd1 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -1494,7 +1494,7 @@ static const struct xattr_handler gfs2_xattr_trusted_handler = {
 	.set    = gfs2_xattr_set,
 };
 
-const struct xattr_handler *gfs2_xattr_handlers_max[] = {
+const struct xattr_handler * const gfs2_xattr_handlers_max[] = {
 	/* GFS2_FS_FORMAT_MAX */
 	&gfs2_xattr_trusted_handler,
 
@@ -1504,4 +1504,4 @@ const struct xattr_handler *gfs2_xattr_handlers_max[] = {
 	NULL,
 };
 
-const struct xattr_handler **gfs2_xattr_handlers_min = gfs2_xattr_handlers_max + 1;
+const struct xattr_handler * const *gfs2_xattr_handlers_min = gfs2_xattr_handlers_max + 1;
-- 
2.34.1

