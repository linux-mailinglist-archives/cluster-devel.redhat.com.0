Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E836F609F1B
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Oct 2022 12:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666607604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7FA3CfjwFWzAnFbI8NyRJA0/XOu8yldPHiMeYItKgCg=;
	b=enLEXj0K7swLyWOroTYiZaeesh3BoC3xL8Y3EQmGCVk/EehmteQi9sY+KomWCV8j0gPPWB
	MAcZu3L9uyppPNhRy1hQFJhS3YKmObdIQpQ0TGWPqVtImb3mODF2W9lRK6FNrKSduW8fQv
	++SdjzrJRw+KAiZrSGDkENCbf41Ftg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-vWRPWSAFM8aecNm8oSVwDQ-1; Mon, 24 Oct 2022 06:33:23 -0400
X-MC-Unique: vWRPWSAFM8aecNm8oSVwDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7366F3C11044;
	Mon, 24 Oct 2022 10:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66AA040C2064;
	Mon, 24 Oct 2022 10:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 277BC19465A3;
	Mon, 24 Oct 2022 10:33:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 335361946587 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 23 Oct 2022 16:42:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 718384A9257; Sun, 23 Oct 2022 16:42:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 697744A9255
 for <cluster-devel@redhat.com>; Sun, 23 Oct 2022 16:42:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DB533806703
 for <cluster-devel@redhat.com>; Sun, 23 Oct 2022 16:42:57 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-500SE1HoNsyTI6LayP20jQ-1; Sun, 23 Oct 2022 12:42:53 -0400
X-MC-Unique: 500SE1HoNsyTI6LayP20jQ-1
Received: by mail-pj1-f44.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso7073936pjc.5; 
 Sun, 23 Oct 2022 09:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7FA3CfjwFWzAnFbI8NyRJA0/XOu8yldPHiMeYItKgCg=;
 b=po5fn88hBtHRi7qSSkXm2mROw+ncXwp0AbWE4MTuL3EtjSggXFJcCsDNrGERL6KSdk
 E+VxSl18fbj5TIh6dpDod4FbdpZZL8GhQXAtgkuP3mHS+EESL8W6HJtRSHcxGFIDBH6E
 +/WInsckNwLcJ76lJXTb7ljsJN19FhG1Cdq+HC157VULfe0b8LHtkFaYLVJ8RklQzuj+
 SD7uprJr6nz4cNn8GkkGHd0fxQC9tfquK5RbvQVGg/8ddvz33gkA4Hpc++Px0JQ0LH0G
 BxJEKuTR6rlX+Dpi6jLbSux6nr1u8YPaDP+K5yGq/XYU2CHHotLn4nyUZic2Wsu5uw4Y
 y/Rg==
X-Gm-Message-State: ACrzQf1q9l0FZJm/vjKfZYVXcgkMhtddFGxiFI55K1nj7Gt93T8qVOHJ
 1FWxXiSFzVJ/BukAGyJJHNLDMCnfu0Lnfl7vq/g=
X-Google-Smtp-Source: AMsMyM40fDEaMu1U8tJRTMY+sHRA0xmLSZnl9K9jBoNEYmEqS9JOVVwXD5ULmpHw6bBd6ChXhql8sQ==
X-Received: by 2002:a17:90b:2241:b0:20d:b273:26af with SMTP id
 hk1-20020a17090b224100b0020db27326afmr32726399pjb.245.1666543372029; 
 Sun, 23 Oct 2022 09:42:52 -0700 (PDT)
Received: from localhost ([223.104.41.250]) by smtp.gmail.com with ESMTPSA id
 l14-20020a65560e000000b004411a054d2dsm16327345pgs.82.2022.10.23.09.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 09:42:51 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: yin31149@gmail.com, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 24 Oct 2022 00:39:49 +0800
Message-Id: <20221023163945.39920-5-yin31149@gmail.com>
In-Reply-To: <20221023163945.39920-1-yin31149@gmail.com>
References: <20221023163945.39920-1-yin31149@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 24 Oct 2022 10:33:21 +0000
Subject: [Cluster-devel] [PATCH -next 4/5] gfs2: fix possible null-ptr-deref
 when parsing param
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, 18801353760@163.com, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

According to commit "vfs: parse: deal with zero length string value",
kernel will set the param->string to null pointer in vfs_parse_fs_string()
if fs string has zero length.

Yet the problem is that, gfs2_parse_param() will dereferences the
param->string, without checking whether it is a null pointer, which may
trigger a null-ptr-deref bug.

This patch solves it by adding sanity check on param->string
in gfs2_parse_param().

Reported-by: syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com
Tested-by: syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com
Cc: agruenba@redhat.com
Cc: cluster-devel@redhat.com
Cc: linux-kernel@vger.kernel.org
Cc: rpeterso@redhat.com
Cc: syzkaller-bugs@googlegroups.com
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 fs/gfs2/ops_fstype.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index c0cf1d2d0ef5..934746f18c25 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1446,12 +1446,18 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 
 	switch (o) {
 	case Opt_lockproto:
+		if (!param->string)
+			goto bad_val;
 		strscpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
 		break;
 	case Opt_locktable:
+		if (!param->string)
+			goto bad_val;
 		strscpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
 		break;
 	case Opt_hostdata:
+		if (!param->string)
+			goto bad_val;
 		strscpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
 		break;
 	case Opt_spectator:
@@ -1535,6 +1541,10 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		return invalfc(fc, "invalid mount option: %s", param->key);
 	}
 	return 0;
+
+bad_val:
+	return invalfc(fc, "Bad value '%s' for mount option '%s'\n",
+		       param->string, param->key);
 }
 
 static int gfs2_reconfigure(struct fs_context *fc)
-- 
2.25.1

