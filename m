Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DED785FBB34
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 21:15:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665515733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=edKKOOO5SuH1hvF3YhfEYTEEKOx9kniO7RvnTL4z9JA=;
	b=SOpdAbcylxhCHeqEP8oE/mxYAfsQF7L+odd6UcBziaRlKBgqciq/BXiJwDu+UBqAsI6tNj
	6fF7moBQR1+UGdmx1ku17nKBkUXvC0EIAjXQyVN8OV7vQO3mmypTl57HNn0mLlqkXnuBWt
	K46Kt4qJ0aKdw0kv067PEy6s9V/bQtI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-pmkPGzK3MymyTPGv0qHuMA-1; Tue, 11 Oct 2022 15:15:31 -0400
X-MC-Unique: pmkPGzK3MymyTPGv0qHuMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DCFF85A583;
	Tue, 11 Oct 2022 19:15:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 023CC477F5F;
	Tue, 11 Oct 2022 19:15:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C93B219465A2;
	Tue, 11 Oct 2022 19:15:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29AF8194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 19:15:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF06E2166B32; Tue, 11 Oct 2022 19:15:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D79052166B2F
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:15:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B90CA185A794
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 19:15:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-q91FZwNcNSO88j-B5jebIQ-1; Tue, 11 Oct 2022 15:15:26 -0400
X-MC-Unique: q91FZwNcNSO88j-B5jebIQ-1
Received: by mail-pf1-f178.google.com with SMTP id f140so14433528pfa.1;
 Tue, 11 Oct 2022 12:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=edKKOOO5SuH1hvF3YhfEYTEEKOx9kniO7RvnTL4z9JA=;
 b=02KkU19op6K4h60uuSz8pDGJgZQOleYYk0lr/W9/XjAxkLu1kBllWkcUC00zf7hyMS
 iX5lJB61jJoJn+TRVN48Xnf5uWymqp6B0tTobINDm8rgph8MzKUAzT4oiYZkDxMNUBw7
 4livd/Yt9aAPcPSkrLHBfg1UT6fwYbP1+E94E3Z5+shbz4zSfwT1LbgZ7dwV79OTUk/5
 0lsrpWjLEdOidPE14wy2gDiY869B/EUHaNfu6Hmayie51gC8mS74flXVxh5JYCEWKYvu
 x5hvRdduiK0QciogHLmz6vAf1I7vAEx1zgjH8wMZOL/0nrMuLNg+0qD5SC2H3VNqKjCk
 K8Ww==
X-Gm-Message-State: ACrzQf1Z82a64pAvswXDXa/ig7paIQNGpyeIsOt6J4vU7opxx7lS+UhW
 1PMcoknvigAzLF5Bfxw3p8QLfjaWqz7RzA==
X-Google-Smtp-Source: AMsMyM7zdApOlOum9a26wp9I+VCjgDp3iYH5QhsGbwtjii1hTZEHDAISUGSZTFksd37y/0kwW+IZhg==
X-Received: by 2002:a63:6285:0:b0:461:686a:f747 with SMTP id
 w127-20020a636285000000b00461686af747mr12817692pgb.403.1665515724412; 
 Tue, 11 Oct 2022 12:15:24 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 i72-20020a639d4b000000b0044ed37dbca8sm8137242pgd.2.2022.10.11.12.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 12:15:23 -0700 (PDT)
Date: Wed, 12 Oct 2022 08:15:17 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
Message-ID: <Y0XAxX4g/9N6qdnD@mail.google.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH] [next] dlm: replace one-element array with
 fixed size array
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
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

One-element arrays are deprecated. So, replace one-element array with
fixed size array member in struct dlm_ls, and refactor the rest of the
code, accordingly.

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/228
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836
Link: https://lore.kernel.org/lkml/Y0W5jkiXUkpNl4ap@mail.google.com/

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lockspace.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e34c3d2639a5..94fadb619ba0 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -670,7 +670,7 @@ struct dlm_ls {
 	void			*ls_ops_arg;
 
 	int			ls_namelen;
-	char			ls_name[1];
+	char			ls_name[DLM_LOCKSPACE_LEN + 1];
 };
 
 /*
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index bae050df7abf..23de0d47cbc1 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	error = -ENOMEM;
 
-	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
+	ls = kzalloc(sizeof(struct dlm_ls), GFP_NOFS);
 	if (!ls)
 		goto out;
 	memcpy(ls->ls_name, name, namelen);
-- 
2.37.3

