Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C360196B
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666038305;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iL1dJ1+HlDDjTxTgJeEvA/bk0AVphIHMY13JSDpQpPE=;
	b=HpFUaN5dtlhrg5jezH3eS1kpvF+TZ0fIehnpcF84W4Y8pvTOHSFUj3t+5bomvFllriwj3F
	DMYKejGEyhayObfXeP2k9YCcBHNfAi85IQzxSxovAx0pJbzufHtaBaNe32R1DqJGqV57ek
	0DSOCHiW6peIUwLCsjWi288NWRoZwHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-NprAousHMaGwsaeycg30jA-1; Mon, 17 Oct 2022 16:25:02 -0400
X-MC-Unique: NprAousHMaGwsaeycg30jA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FE69101A52A;
	Mon, 17 Oct 2022 20:25:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73E9D1401C30;
	Mon, 17 Oct 2022 20:25:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5AB8419465A0;
	Mon, 17 Oct 2022 20:25:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CB92B194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 20:24:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEAA440398BF; Mon, 17 Oct 2022 20:24:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B76C440398B1
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:24:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D05587B2A3
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 20:24:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-328-ws8cnV9_Ofaj-BedTqZINQ-1; Mon, 17 Oct 2022 16:24:57 -0400
X-MC-Unique: ws8cnV9_Ofaj-BedTqZINQ-1
Received: by mail-pl1-f173.google.com with SMTP id h2so4465336plb.2
 for <cluster-devel@redhat.com>; Mon, 17 Oct 2022 13:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iL1dJ1+HlDDjTxTgJeEvA/bk0AVphIHMY13JSDpQpPE=;
 b=pW88ZQgvZHnX5/J+JQAyvty/gSRvEcbdf7XUIXPTOaguDbt4WCzty1M4sd7sz9RkaS
 zTR0G/3bupfD3xOVDAszuX2UMabx0Ynr1BVLi+pHJrWOlUYKWa7317b//blSeL9pfVW6
 BL6PPYQi/5KHWt5iVHEFm2FqgtSo9jl+DphJe77MR33dssiGopsiJn46HwTAd4+2NddN
 o5+F/zqel+ALUKqYwMWcDc+K24fgf8OTVZGK/yBjbdWqRfTKkJh3ORDtmQuNdi3wza6n
 pwRPaNST7wvWgRrB/jp5zt9foiJPSl0/QJo6MKhLEeDi/7goeb+s9+jQFt3xtilI8vfw
 owpw==
X-Gm-Message-State: ACrzQf1wlZkMbgwtvlrdGifHTbtsLUEupEGsJ+xuCDKSdiqeVoxioWyf
 SB+4LPHIvi5Nsq0PRqjp/fY=
X-Google-Smtp-Source: AMsMyM4nI+J5VGj2q/Y5LFK0UbiMCKinN+LtZLSm5wfBwq1+N4H+I7ep8VehInFIJJVIXWLltjZUwA==
X-Received: by 2002:a17:90a:8c97:b0:20d:a1a2:bfda with SMTP id
 b23-20020a17090a8c9700b0020da1a2bfdamr15543342pjo.234.1666038296428; 
 Mon, 17 Oct 2022 13:24:56 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:24:56 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:30 -0700
Message-Id: <20221017202451.4951-3-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v3 02/23] filemap: Added
 filemap_get_folios_tag()
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This is the equivalent of find_get_pages_range_tag(), except for folios
instead of pages.

One noteable difference is filemap_get_folios_tag() does not take in a
maximum pages argument. It instead tries to fill a folio batch and stops
either once full (15 folios) or reaching the end of the search range.

The new function supports large folios, the initial function did not
since all callers don't use large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pagemap.h |  2 ++
 mm/filemap.c            | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 74d87e37a142..28275eecb949 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -740,6 +740,8 @@ unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
 		pgoff_t end, struct folio_batch *fbatch);
 unsigned filemap_get_folios_contig(struct address_space *mapping,
 		pgoff_t *start, pgoff_t end, struct folio_batch *fbatch);
+unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
+		pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch);
 unsigned find_get_pages_range_tag(struct address_space *mapping, pgoff_t *index,
 			pgoff_t end, xa_mark_t tag, unsigned int nr_pages,
 			struct page **pages);
diff --git a/mm/filemap.c b/mm/filemap.c
index 08341616ae7a..aa6e90ab0551 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2262,6 +2262,59 @@ unsigned filemap_get_folios_contig(struct address_space *mapping,
 }
 EXPORT_SYMBOL(filemap_get_folios_contig);
 
+/**
+ * filemap_get_folios_tag - Get a batch of folios matching @tag.
+ * @mapping:    The address_space to search
+ * @start:      The starting page index
+ * @end:        The final page index (inclusive)
+ * @tag:        The tag index
+ * @fbatch:     The batch to fill
+ *
+ * Same as filemap_get_folios, but only returning folios tagged with @tag
+ *
+ * Return: The number of folios found
+ * Also update @start to index the next folio for traversal
+ */
+unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
+			pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch)
+{
+	XA_STATE(xas, &mapping->i_pages, *start);
+	struct folio *folio;
+
+	rcu_read_lock();
+	while ((folio = find_get_entry(&xas, end, tag)) != NULL) {
+		/* Shadow entries should never be tagged, but this iteration
+		 * is lockless so there is a window for page reclaim to evict
+		 * a page we saw tagged. Skip over it.
+		 */
+		if (xa_is_value(folio))
+			continue;
+		if (!folio_batch_add(fbatch, folio)) {
+			unsigned long nr = folio_nr_pages(folio);
+
+			if (folio_test_hugetlb(folio))
+				nr = 1;
+			*start = folio->index + nr;
+			goto out;
+		}
+	}
+	/*
+	 * We come here when there is no page beyond @end. We take care to not
+	 * overflow the index @start as it confuses some of the callers. This
+	 * breaks the iteration when there is a page at index -1 but that is
+	 * already broke anyway.
+	 */
+	if (end == (pgoff_t)-1)
+		*start = (pgoff_t)-1;
+	else
+		*start = end + 1;
+out:
+	rcu_read_unlock();
+
+	return folio_batch_count(fbatch);
+}
+EXPORT_SYMBOL(filemap_get_folios_tag);
+
 /**
  * find_get_pages_range_tag - Find and return head pages matching @tag.
  * @mapping:	the address_space to search
-- 
2.36.1

