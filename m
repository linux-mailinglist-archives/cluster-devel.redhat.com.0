Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B965DE26
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672866906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yo+m9KCho02Llmwjmz5bDSbKVzw32DqjrZ5KrSHhgyc=;
	b=OoXBBfOsjizBv/0Ept7LDv2NNMAQBz0eLZthMZWCbipZj6VsdyowW2zSFJrdOd3kkvHcB0
	8kY1IukrNHzonw3TtuJVdPvQQ5bFCRb6dVuB0C8ggL+x4xUUBdCflxvC744CyPO9I4iFX8
	ftbjmnN0kL7QXzuxcLBki8LjDlERQPg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179--S44wssbOgKn3Bd1cJhybA-1; Wed, 04 Jan 2023 16:15:03 -0500
X-MC-Unique: -S44wssbOgKn3Bd1cJhybA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E843380D0E4;
	Wed,  4 Jan 2023 21:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC34C35455;
	Wed,  4 Jan 2023 21:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AFAA31946594;
	Wed,  4 Jan 2023 21:15:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 08F3F1946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 21:15:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0F2451E5; Wed,  4 Jan 2023 21:14:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8FA235455
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:14:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B91B5858F0E
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:14:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-rOxp1ZhZOCKb3AHk2ONGfw-1; Wed, 04 Jan 2023 16:14:58 -0500
X-MC-Unique: rOxp1ZhZOCKb3AHk2ONGfw-1
Received: by mail-pl1-f182.google.com with SMTP id 17so37263884pll.0
 for <cluster-devel@redhat.com>; Wed, 04 Jan 2023 13:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yo+m9KCho02Llmwjmz5bDSbKVzw32DqjrZ5KrSHhgyc=;
 b=cboE+DBMrbQheaoEDKAVkod/iT/1l88VHWcvC8J+xWDq8zjXbD1o08KQs70VlBepGP
 ZS2nPnwWTmaG3PkR/oxqi4OvsKhLrMWJgruOEFQezRfqGUbpUTPVlh7BQMA16Tj+qfp0
 23AmlBRJk1teutomYuh0obJVQFV9fCg9kxiltloZPaTpsCTVvyTnoZfCeEBn1vcWcboN
 JH9vQpTFkO7xDS+2aHjbyqjdibg/E1ZoignzOTmYghqWXQ9bzy8eBHy1UmZMtrY9R85X
 zGwKG2/E/EV09O8KD+DV88zgWF+i5lYOEptdwt+qGL6n9oKXVpu760oqlyDSmCdGD50s
 zocA==
X-Gm-Message-State: AFqh2kpfeXvDN0aPJ4b1tVy84wJIUSut71hDCryWIzzr/qH3ZgCS7uJW
 gDI01fG23WYYmgGD6mwNTP8UhnV9McN3ew==
X-Google-Smtp-Source: AMrXdXtzyCslo5KrrtE6aj4KE0tZMImyQpChectqYz62yJ5Pkw2zwmGtohmj+/DGwHCRBdZk95hgJQ==
X-Received: by 2002:a17:90b:92:b0:225:eda7:13e with SMTP id
 bb18-20020a17090b009200b00225eda7013emr35757516pjb.40.1672866896879; 
 Wed, 04 Jan 2023 13:14:56 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:14:56 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:26 -0800
Message-Id: <20230104211448.4804-2-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5 01/23] pagemap: Add filemap_grab_folio()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add function filemap_grab_folio() to grab a folio from the page cache.
This function is meant to serve as a folio replacement for
grab_cache_page, and is used to facilitate the removal of
find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 29e1f9e76eb6..468183be67be 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -546,6 +546,26 @@ static inline struct folio *filemap_lock_folio(struct address_space *mapping,
 	return __filemap_get_folio(mapping, index, FGP_LOCK, 0);
 }
 
+/**
+ * filemap_grab_folio - grab a folio from the page cache
+ * @mapping: The address space to search
+ * @index: The page index
+ *
+ * Looks up the page cache entry at @mapping & @index. If no folio is found,
+ * a new folio is created. The folio is locked, marked as accessed, and
+ * returned.
+ *
+ * Return: A found or created folio. NULL if no folio is found and failed to
+ * create a folio.
+ */
+static inline struct folio *filemap_grab_folio(struct address_space *mapping,
+					pgoff_t index)
+{
+	return __filemap_get_folio(mapping, index,
+			FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+			mapping_gfp_mask(mapping));
+}
+
 /**
  * find_get_page - find and get a page reference
  * @mapping: the address_space to search
-- 
2.38.1

