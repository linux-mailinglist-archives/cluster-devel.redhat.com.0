Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B155C6F3364
	for <lists+cluster-devel@lfdr.de>; Mon,  1 May 2023 18:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682957163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5bPsp2g0VrYtWLji3rbRewaAYsdPIfyZMtsPhsv1sbI=;
	b=WYwtqwpJj0j+w12S19ScJO1d4AoyAo0o4bEFmBsywhmHZGIn0cPSJxcvHpF+3PnvUtXY/k
	MUadZE7SYliLrnjR0JINXGXRKAs4auvDdhoZDWlmkzVD+kr7pkyu3X2HTtHXVhuZwRuXUY
	KpHO+biIW9p4aURZ3SLpRBlFxEqow80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-qyHUY47HOb2C8VDCK2-HmQ-1; Mon, 01 May 2023 12:04:28 -0400
X-MC-Unique: qyHUY47HOb2C8VDCK2-HmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7557DA0F38C;
	Mon,  1 May 2023 16:01:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D0202022EC9;
	Mon,  1 May 2023 16:01:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DDED21946595;
	Mon,  1 May 2023 16:01:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1D521946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  1 May 2023 16:01:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8FA1140C6E6A; Mon,  1 May 2023 16:01:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8765840C6E68
 for <cluster-devel@redhat.com>; Mon,  1 May 2023 16:01:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64E64857A9F
 for <cluster-devel@redhat.com>; Mon,  1 May 2023 16:01:22 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-M34HaJTiNvGkoSgpzKy8RQ-1; Mon, 01 May 2023 12:00:58 -0400
X-MC-Unique: M34HaJTiNvGkoSgpzKy8RQ-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230501160055euoutp01bf8dd46ba56956d2e72e802d015d0e2d~bEFgC7tr_2917829178euoutp01I
 for <cluster-devel@redhat.com>; Mon,  1 May 2023 16:00:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230501160055euoutp01bf8dd46ba56956d2e72e802d015d0e2d~bEFgC7tr_2917829178euoutp01I
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230501160054eucas1p2215c8b65b65a2b6e83d32e9760f172f7~bEFe6oP7k1454814548eucas1p2I;
 Mon,  1 May 2023 16:00:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FC.98.42423.632EF446; Mon,  1
 May 2023 17:00:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230501160054eucas1p13f970393e34ba354e9cc0f8d4d730873~bEFehod0e1104711047eucas1p1l;
 Mon,  1 May 2023 16:00:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230501160054eusmtrp26dd77538775ce6d394c1cc85cf621753~bEFefz-OM1544915449eusmtrp2I;
 Mon,  1 May 2023 16:00:54 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-07-644fe236b3c6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E6.CB.14344.632EF446; Mon,  1
 May 2023 17:00:54 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230501160054eusmtip26faf98cd3d8de1b1aebc0c3abf9fa111~bEFeTEYl01679116791eusmtip2z;
 Mon,  1 May 2023 16:00:54 +0000 (GMT)
Received: from [106.110.32.65] (106.110.32.65) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 May 2023 17:00:52 +0100
Message-ID: <6dcf69ee-21cd-ae06-c250-e991652989ac@samsung.com>
Date: Mon, 1 May 2023 18:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Matthew Wilcox <willy@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <ZE/ew1VpU/a1gqQP@casper.infradead.org>
X-Originating-IP: [106.110.32.65]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRmVeSWpSXmKPExsWy7djP87pmj/xTDC49VLOYs34Nm8Xqu/1s
 Fh9uTmKyOLn6MZvFu6bfLBaXn/BZrFx9lMli7y1ti5nz7rBZXFrkbrFn70mg1K45bBb31vxn
 tbhw4DSrxa4/O9gtbkx4ymjxbPdGZovfP+awOQh5bF6h5XH5bKnHplWdbB6bPk1i9zgx4zeL
 x+4Fn5k8dt9sYPN4v+8qm8eKaReZPD5vkgvgiuKySUnNySxLLdK3S+DK+NP4gbVgrUxFx7PM
 BsYnIl2MHBwSAiYSP++qdTFycQgJrGCUOPF7GiuE84VRYuOyuSwQzmdGib72PWxdjJxgHS1d
 7VBVyxklJnz9yQhXNefQTKjMDkaJQ8sfsoK08ArYSfz42gXWziKgInHwRycbRFxQ4uTMJywg
 tqhAtMTifVPAbGEBU4k/V9+B2SICARLTp10Fm8MscIhF4shDEQhbXOLWk/lMIE+wCWhJNHay
 g4Q5ga6bfHc7VLm8xPa3c5ghrlaUmHTzPSuEXStxasstJpA7JQTecUp8+NjHBJFwkXh8/Ao7
 hC0s8er4FihbRuL/zvlQNdUST2/8ZoZobmGU6N+5ng0SktYSfWdyQExmAU2J9bv0IaKOEjNv
 aUGYfBI33gpCXMYnMWnbdOYJjKqzkMJhFpK/ZiF5YBbCzAWMLKsYxVNLi3PTU4sN81LL9YoT
 c4tL89L1kvNzNzECk+Lpf8c/7WCc++qj3iFGJg7GQ4wSHMxKIrwfCv1ShHhTEiurUovy44tK
 c1KLDzFKc7AoifNq255MFhJITyxJzU5NLUgtgskycXBKNTCxBBq6+35Q+rtS8cXhS/IaXyJL
 nHa9ef/Y4LRFnO7UIy8MnMUvN2xhfcQjKK8Y8OHA/uQnR3daz672PZk2T1HqvdKZNa91mUL0
 z6u8WPGpax/LlYZ1F9QFn1Q0rWNkP/LtqtWjPbUKh1zU31jzaS+dxjHlntL/KvPkpwWxe7b/
 09f6d8qsP3HSjKf5h3Ry1u2Vbl1v+Kdg/WoWiY1h+aXNBl9bPk3269KSOlNYnctbsipZav6c
 NGXmxTx76gvZHt8r+Vha+efe6anKFhmKZx9Epf1PW6V3puP6bkaP5EPR8y/y6NmsUCk5asWy
 surS7WlMpqdFTJQMhMqWrlsZu/PkxJ6QPqGnUat9ha++vBuuxFKckWioxVxUnAgA/vdctfkD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xe7pmj/xTDP7f4LaYs34Nm8Xqu/1s
 Fh9uTmKyOLn6MZvFu6bfLBaXn/BZrFx9lMli7y1ti5nz7rBZXFrkbrFn70mg1K45bBb31vxn
 tbhw4DSrxa4/O9gtbkx4ymjxbPdGZovfP+awOQh5bF6h5XH5bKnHplWdbB6bPk1i9zgx4zeL
 x+4Fn5k8dt9sYPN4v+8qm8eKaReZPD5vkgvgitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx
 1DM0No+1MjJV0rezSUnNySxLLdK3S9DL+NP4gbVgrUxFx7PMBsYnIl2MnBwSAiYSLV3trF2M
 XBxCAksZJd6tPsEOkZCR2PjlKiuELSzx51oXG0TRR0aJ7vuvWSCcHYwS83oXgFXxCthJ/PgK
 UsXJwSKgInHwRycbRFxQ4uTMJywgtqhAtMSN5d+YQGxhAVOJP1ffAcU5OEQE/CRmvQoGCTML
 HGKR2HAxHGL+NSaJ/4cns0EkxCVuPZnPBFLPJqAl0dgJdign0AeT725nhSjRlGjd/psdwpaX
 2P52DjPEA4oSk26+h3qmVuLz32eMExhFZyG5bhaSDbOQjJqFZNQCRpZVjCKppcW56bnFRnrF
 ibnFpXnpesn5uZsYgQll27GfW3Ywrnz1Ue8QIxMH4yFGCQ5mJRHeD4V+KUK8KYmVValF+fFF
 pTmpxYcYTYFBNJFZSjQ5H5jS8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg
 +pg4OKUamNSLL+lJ5BoHKriueHfcQ0FA2uBak/bkST+uPgraEPbsRvKOcIVrd7p89aNvLU+T
 1MsOqN0aYHZxq8zqBQaTJ29+ZaT1ZULD5jiGy+/36q2e/dKNb+s2u8U/DkeFtS0zmab/Zsfx
 0Jn55Q3B7lG8N8sEGVLuCC07wWV7+cKCF9fT/k1Kn7dKNXxKBQOn0TH5sPNlffFP94beuzfh
 3e+enZztGzweJMydWjFB/LL78zSZ/8emzlgo0JBzVrVk/SamzOrLLltPvIw9vUrg3MvtQUHe
 vafzv4ewKy+6Oy/fNkHbOLk4xqM+R3BzQ+tHm8BPwi9nzlfmr+6+2vvAdNXusg49qZ6HH2b/
 Ub02a+dnl3YlluKMREMt5qLiRAAR06BPsQMAAA==
X-CMS-MailID: 20230501160054eucas1p13f970393e34ba354e9cc0f8d4d730873
X-Msg-Generator: CA
X-RootMTR: 20230501154622eucas1p2d9dea99a75a8b2ccc347fc6e8ca7decb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230501154622eucas1p2d9dea99a75a8b2ccc347fc6e8ca7decb
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-18-hch@lst.de>
 <ZExgzbBCbdC1y9Wk@bombadil.infradead.org>
 <ZExw0eW52lYj2R1m@casper.infradead.org>
 <ZE8ue9Mx6n2T0yn6@bombadil.infradead.org>
 <CGME20230501154622eucas1p2d9dea99a75a8b2ccc347fc6e8ca7decb@eucas1p2.samsung.com>
 <ZE/ew1VpU/a1gqQP@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 17/17] fs: add CONFIG_BUFFER_HEAD
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
Cc: Jens Axboe <axboe@kernel.dk>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick
 J. Wong" <djwong@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daniel Gomez <da.gomez@samsung.com>, linux-mm@kvack.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

>> No but the only place to add that would be in the block cache. Adding
>> that alone to the block cache doesn't fix the issue. The below patch
>> however does get us by.
> 
> That's "working around the error", not fixing it ... probably the same
> root cause as your other errors; at least I'm not diving into them until
> the obvious one is fixed.
> 
>> >From my readings it does't seem like readahead_folio() should always
>> return non-NULL, and also I couldn't easily verify the math is right.
> 
> readahead_folio() always returns non-NULL.  That's guaranteed by how
> page_cache_ra_unbounded() and page_cache_ra_order() work.  It allocates
> folios, until it can't (already-present folio, ENOMEM, EOF, max batch
> size) and then calls the filesystem to make those folios uptodate,
> telling it how many folios it put in the page cache, where they start.
> 
> Hm.  The fact that it's coming from page_cache_ra_unbounded() makes
> me wonder if you updated this line:
> 
>                 folio = filemap_alloc_folio(gfp_mask, 0);
> 
> without updating this line:
> 
>                 ractl->_nr_pages++;
> 
> This is actually number of pages, not number of folios, so needs to be
> 		ractl->_nr_pages += 1 << order;
> 

I already had a patch which did the following:

ractl->_nr_pages += folio_nr_pages(folio);

but the variable `i` in the loop was not updated properly (assumption of zero order folio). This now
fixes the crash:

@@ -210,7 +210,7 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
        unsigned long index = readahead_index(ractl);
        gfp_t gfp_mask = readahead_gfp_mask(mapping);
        unsigned long i;
-
+       int order = 0;
        /*
         * Partway through the readahead operation, we will have added
         * locked pages to the page cache, but will not yet have submitted
@@ -223,6 +223,9 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
         */
        unsigned int nofs = memalloc_nofs_save();

+       if (mapping->host->i_blkbits > PAGE_SHIFT)
+               order = mapping->host->i_blkbits - PAGE_SHIFT;
+
        filemap_invalidate_lock_shared(mapping);
        /*
         * Preallocate as many pages as we will need.
@@ -245,7 +248,7 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
                        continue;
                }

-               folio = filemap_alloc_folio(gfp_mask, 0);
+               folio = filemap_alloc_folio(gfp_mask, order);
                if (!folio)
                        break;
                if (filemap_add_folio(mapping, folio, index + i,
@@ -259,7 +262,8 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
                if (i == nr_to_read - lookahead_size)
                        folio_set_readahead(folio);
                ractl->_workingset |= folio_test_workingset(folio);
-               ractl->_nr_pages++;
+               ractl->_nr_pages += folio_nr_pages(folio);
+               i += folio_nr_pages(folio) - 1;
        }

> various other parts of page_cache_ra_unbounded() need to be examined
> carefully for assumptions of order-0; it's never been used for that
> before.  all the large folio work has concentrated on
> page_cache_ra_order()

As you have noted here, this needs to be examined more carefully. Even though the patches fix the
crash, fio with verify option fails (i.e write and read are not giving the same output).

I think it is better to send an RFC patch series on top of Christoph's work with optional
BUFFER_HEAD to iron out some core issues/bugs.

