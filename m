Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA816C09FE
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Mar 2023 06:19:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679289584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=76ELY9xLQn4IJW/KKPmxMLn2xf0xOodzC5hbi9tbLEo=;
	b=Phe7CHjePS4M2Ti1nsxGQPVuzKHoj9pWk9ZoFrD2fuG9kvDjxkWzOYAxt5GkekzgXxIXot
	VOwNEOHfUn+sdbs0z9ABl5UY7Uqtscx3qMRniwLQA2os9AsUVsmrfgIkew0uK9Hihr4xQL
	nZSoGIr1gA67gV+fKvLcmj8DG+TGn6A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-2Jgo9ga9MgO8FPzHcRXtLQ-1; Mon, 20 Mar 2023 01:19:40 -0400
X-MC-Unique: 2Jgo9ga9MgO8FPzHcRXtLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 039303811F21;
	Mon, 20 Mar 2023 05:19:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B868C2123;
	Mon, 20 Mar 2023 05:19:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD45F1946A52;
	Mon, 20 Mar 2023 05:19:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 56EE3194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 20 Mar 2023 05:19:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3BFA1492C14; Mon, 20 Mar 2023 05:19:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 349A6492C13
 for <cluster-devel@redhat.com>; Mon, 20 Mar 2023 05:19:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16ADF800B23
 for <cluster-devel@redhat.com>; Mon, 20 Mar 2023 05:19:37 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668--MKYbxxgOyCYv41ytXYr_g-1; Mon, 20 Mar 2023 01:19:35 -0400
X-MC-Unique: -MKYbxxgOyCYv41ytXYr_g-1
Received: by mail-qv1-f50.google.com with SMTP id 97so6990958qvb.6
 for <cluster-devel@redhat.com>; Sun, 19 Mar 2023 22:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679289575;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=76ELY9xLQn4IJW/KKPmxMLn2xf0xOodzC5hbi9tbLEo=;
 b=fuzft6eubeCoaOiSEONyuXhe8WqQNZadfqwAbPSqaWOoOtfkqDdOKiI2KVxOd5YTTW
 HgD/8X9Y2lY9XePN3BPTUzkPCaE0dk7DrZcUdBTt+KHqmpg/adn0ZxVWj9+BDTWA/N5M
 dGfYlb5owo8zSsz0snZcQ8e13l/DeCDDijvjkUb6dS0pWyJeOpWorlfN34kfUuR4n1IV
 /vTF8xPVQD4jpC8t8hNGF9dhHg+mDEE13e/JHz0cbBD6ovy0iw21h3Q+OhvceaLUcEhK
 ABh9TFnWXGFq/TJZjmMrWMfq+ZG1HzENXLbh71RBvih7YmS2sMjtKntkwa67IZeiOm1M
 133A==
X-Gm-Message-State: AO0yUKW2mx03OsgT8pQgjKFl9mm9Vl4QRyoEGVlbMjwLTW3vT6gq5FL/
 cEnPw8Ac6FSzSJQhC/GsgJFUyw==
X-Google-Smtp-Source: AK7set/4aSMg0lOiupi+qDtWYFFs7L1A7Zocw+KE8xhWhyWQ8cPaDq5MMjDuNzS9Qd93vE1UyEn9+g==
X-Received: by 2002:a05:6214:29e4:b0:5b9:3f17:b219 with SMTP id
 jv4-20020a05621429e400b005b93f17b219mr20607901qvb.3.1679289574718; 
 Sun, 19 Mar 2023 22:19:34 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a05620a014e00b0073b45004754sm6694504qkn.34.2023.03.19.22.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 22:19:32 -0700 (PDT)
Date: Sun, 19 Mar 2023 22:19:21 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20230307143410.28031-5-hch@lst.de>
Message-ID: <9d1aaa4-1337-fb81-6f37-74ebc96f9ef@google.com>
References: <20230307143410.28031-1-hch@lst.de>
 <20230307143410.28031-5-hch@lst.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 4/7] shmem: remove
 shmem_get_partial_folio
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Mar 2023, Christoph Hellwig wrote:

> Add a new SGP_FIND mode for shmem_get_partial_folio that works like
> SGP_READ, but does not check i_size.  Use that instead of open coding
> the page cache lookup in shmem_get_partial_folio.  Note that this is
> a behavior change in that it reads in swap cache entries for offsets
> outside i_size, possibly causing a little bit of extra work.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/shmem_fs.h |  1 +
>  mm/shmem.c               | 46 ++++++++++++----------------------------
>  2 files changed, 15 insertions(+), 32 deletions(-)

I thought this was fine at first, and of course it's good for all the
usual cases; but not for shmem_get_partial_folio()'s awkward cases.

Two issues with it.

One, as you highlight above, the possibility of reading more swap
unnecessarily.  I do not mind if partial truncation entails reading
a little unnecessary swap; but I don't like the common case of
truncation to 0 to entail that; even less eviction; even less
unmounting, when eviction of all risks reading lots of swap.
The old code behaved well at i_size 0, the new code not so much.

Two, truncating a large folio is expected to trim that folio down
to the smaller sizei (if splitting allows); but SGP_FIND was coded
too much like SGP_READ, in reporting fallocated (!uptodate) folios
as NULL, unlike before.  Then the following loop of shmem_undo_range()
removed that whole folio - removing pages "promised" to the file by
the earlier fallocate.  Not as seriously bad as deleting data would be,
and not very likely to be noticed, but still not right.

Replacing shmem_get_partial_folio() by SGP_FIND was a good direction
to try, but it hasn't worked out.  I tried to get SGPs to work right
for it before, when shmem_get_partial_page() was introduced; but I
did not manage to do so.  I think we have to go back to how this was.

Andrew, please replace Christoph's "shmem: remove shmem_get_partial_folio"
in mm-unstable by this patch below, which achieves the same object
(eliminating FGP_ENTRY) while keeping closer to the old mechanism.

[PATCH] shmem: shmem_get_partial_folio use filemap_get_entry

To avoid use of the FGP_ENTRY flag, adapt shmem_get_partial_folio() to
use filemap_get_entry() and folio_lock() instead of __filemap_get_folio().
Update "page" in the comments there to "folio".

Signed-off-by: Hugh Dickins <hughd@google.com>
---

 mm/shmem.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -886,14 +886,21 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
 
 	/*
 	 * At first avoid shmem_get_folio(,,,SGP_READ): that fails
-	 * beyond i_size, and reports fallocated pages as holes.
+	 * beyond i_size, and reports fallocated folios as holes.
 	 */
-	folio = __filemap_get_folio(inode->i_mapping, index,
-					FGP_ENTRY | FGP_LOCK, 0);
-	if (!xa_is_value(folio))
+	folio = filemap_get_entry(inode->i_mapping, index);
+	if (!folio)
 		return folio;
+	if (!xa_is_value(folio)) {
+		folio_lock(folio);
+		if (folio->mapping == inode->i_mapping)
+			return folio;
+		/* The folio has been swapped out */
+		folio_unlock(folio);
+		folio_put(folio);
+	}
 	/*
-	 * But read a page back from swap if any of it is within i_size
+	 * But read a folio back from swap if any of it is within i_size
 	 * (although in some cases this is just a waste of time).
 	 */
 	folio = NULL;

