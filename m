Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F66FEDF7
	for <lists+cluster-devel@lfdr.de>; Thu, 11 May 2023 10:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683794521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ANF2ojEn6NgL1D5sNhaC7YhuPd6wu0qnDYngj5pnPkU=;
	b=IcHBsqoNlY7mC80AEn2/iz/d2SqFedcqfBw+HlgaGgMZqnupcRn5QxXbEXQCaDU5cKPHFS
	Nx6QUrtpJlU8hsR3q82HngNA9ucrYm5xuMd3azumjqumDAnCN9wziSd4SPt6RdWJht3xL1
	bVeKxNiHVjy+or5HNCtXl/pJclNw0o0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-EdRY5rokPr6StYaUbSzDGg-1; Thu, 11 May 2023 04:41:58 -0400
X-MC-Unique: EdRY5rokPr6StYaUbSzDGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EFEE3C1015C;
	Thu, 11 May 2023 08:41:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D56814171BC;
	Thu, 11 May 2023 08:41:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21D3219451CB;
	Thu, 11 May 2023 08:41:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E4211946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 10 May 2023 22:12:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B54C40102F; Wed, 10 May 2023 22:12:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 232FE48FB11
 for <cluster-devel@redhat.com>; Wed, 10 May 2023 22:12:48 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C362080269A
 for <cluster-devel@redhat.com>; Wed, 10 May 2023 22:12:48 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-7PCwpx9XNnGilFIklJPy8Q-1; Wed, 10 May 2023 18:12:47 -0400
X-MC-Unique: 7PCwpx9XNnGilFIklJPy8Q-1
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3352b8b9b70so44648575ab.0; 
 Wed, 10 May 2023 15:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683756765; x=1686348765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ANF2ojEn6NgL1D5sNhaC7YhuPd6wu0qnDYngj5pnPkU=;
 b=mBVHZLD520eQbf4IshH7F+S4tdU6JAFqlBit9jw7giddLBAKn5MGcoldG1O82cModg
 8CEKxadAybIwKhAoMZEMn+ofkJ4VL2SV5E0fs+lOR52jn1QCxDckwtyFZsGpQElHNxwT
 SzHq8vcP8muqVHbMvmRoVigBKE3ja/49lwKZidMsUBJpr4f7OGsoWzQ0Zk7TS0TLG1il
 glHLFk4yxhFUmEbKE30HNzr1WglwvBcIOai/p8Uy6uHCwQLsw3F22SKWUMM0+MhdJdUG
 5huY5wTVzHsHmjNwA3WpGtKPzFQ8dAtYFB46MePonTzgMK98QFYkfUsY5+jwMPhPFp+c
 YD2A==
X-Gm-Message-State: AC+VfDynf1BBwPC1jA6GYOeYK+8CTNKw3uPYkJUP3pbySt7r8Qa7G/Ou
 aTfFQNAOoJbic6t8HHj1IvShU8g1cWTeAg==
X-Google-Smtp-Source: ACHHUZ4Jhhks3fH3zcxryOSm0ZDL1Wf68o9U3wBGpEuGzWV3uQdUM4WI6wNLfJv2JD+Q7XeYK/0fRQ==
X-Received: by 2002:a6b:fe19:0:b0:76a:3481:2f17 with SMTP id
 x25-20020a6bfe19000000b0076a34812f17mr14670907ioh.1.1683756765327; 
 Wed, 10 May 2023 15:12:45 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d8245000000b0075c1eb2e228sm3844485ioo.15.2023.05.10.15.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 15:12:44 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>
Date: Wed, 10 May 2023 22:12:37 +0000
Message-ID: <20230510221237.3509484-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Thu, 11 May 2023 08:41:47 +0000
Subject: [Cluster-devel] [PATCH] dlm: Replace all non-returning strlcpy with
 strscpy
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
 linux-hardening@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 fs/dlm/config.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index d31319d08581..2beceff024e3 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -116,9 +116,9 @@ static ssize_t cluster_cluster_name_store(struct config_item *item,
 {
 	struct dlm_cluster *cl = config_item_to_cluster(item);
 
-	strlcpy(dlm_config.ci_cluster_name, buf,
+	strscpy(dlm_config.ci_cluster_name, buf,
 				sizeof(dlm_config.ci_cluster_name));
-	strlcpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
+	strscpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
 	return len;
 }
 

