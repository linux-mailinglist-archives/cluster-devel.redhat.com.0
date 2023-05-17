Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2174706B84
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 16:47:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684334835;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7c2YUVjEhEkACJ2qGx3ePwIsHucOGV8Y0+ZlGBhfQjI=;
	b=Xm03/eMKIJm8q9EkuE2UDGaNAtSiT633cvRGL0y/F+VFNMdi/ebrfPFElx7HIYg5Q6ABNQ
	80Eij/o6RCLjaSbd7aPu8bVNaO2TJbyjH2giZm1KmtL6o7gkhcOPQiqsE/HfMrzq9itG4e
	nG521mpUA8Q6qtUcLmGOSPz9Mw09jtU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-0TagNoIzO5WuiN9tlSBRNQ-1; Wed, 17 May 2023 10:47:11 -0400
X-MC-Unique: 0TagNoIzO5WuiN9tlSBRNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB2A101A557;
	Wed, 17 May 2023 14:47:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83BF6492C3F;
	Wed, 17 May 2023 14:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 35A3B19465B2;
	Wed, 17 May 2023 14:47:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F387619465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 14:47:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1C48C15BA0; Wed, 17 May 2023 14:47:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A31C16026
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 14:47:07 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77F3C3C0F43A
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 14:47:07 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-ahl8kiRvPqCWvPLb-1fT9g-1; Wed, 17 May 2023 10:47:05 -0400
X-MC-Unique: ahl8kiRvPqCWvPLb-1fT9g-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230517144703euoutp02cd84816bdd7e9ab96d84568230f609d8~f9Zks-EIH0252402524euoutp02g
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 14:47:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230517144703euoutp02cd84816bdd7e9ab96d84568230f609d8~f9Zks-EIH0252402524euoutp02g
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230517144703eucas1p1e4a4d7e9dc9074edc22be143cfd54feb~f9ZkSpbRz2461924619eucas1p1U;
 Wed, 17 May 2023 14:47:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 31.7A.37758.7E8E4646; Wed, 17
 May 2023 15:47:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230517144703eucas1p1550db888e29fc5b182c202f24adddb87~f9Zj_bNwa1358013580eucas1p1s;
 Wed, 17 May 2023 14:47:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230517144703eusmtrp17735afbad4559fd15283d75c43d5187b~f9Zj9psz62220322203eusmtrp1h;
 Wed, 17 May 2023 14:47:03 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-de-6464e8e7a478
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 69.1F.10549.6E8E4646; Wed, 17
 May 2023 15:47:03 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230517144702eusmtip2ae8bcb65480eb718cbafe9f04badd0e1~f9ZjwNMM01658016580eusmtip2Y;
 Wed, 17 May 2023 14:47:02 +0000 (GMT)
Received: from localhost (106.110.32.140) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 May 2023 15:47:02 +0100
Date: Wed, 17 May 2023 16:47:01 +0200
From: Pankaj Raghav <p.raghav@samsung.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20230517144701.4dnd5pzvzudccc56@localhost>
MIME-Version: 1.0
In-Reply-To: <20230517032442.1135379-5-willy@infradead.org>
X-Originating-IP: [106.110.32.140]
X-ClientProxiedBy: CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djP87rPX6SkGJxaIWaxbd1udos569ew
 WZxc/ZjNYsGbvWwWe/aeZLG4MeEpo0XX7FY2i98/5rA5cHhsXqHlsWlVJ5vHiRm/WTze77vK
 5rF+y1UWj8+b5ALYorhsUlJzMstSi/TtErgyLvxcwlywiK1iydQtbA2Ma1m7GDk5JARMJBZO
 3MzexcjFISSwglHiwLRlbBDOF0aJ9hknoZzPjBJnGj6zw7Rs6rwO1bKcUeLq1u8IVQ9fdTJB
 OFsYJfa0vGUBaWERUJX4ceMu0EYODjYBLYnGTrBJIgLGEhOX72cDsZkFFjBJbJxRD2ILCyRJ
 HPmyF6yVV8BcouHIZ0YIW1Di5MwnYHFOAWuJxdNes0BcpCTRsPkMlF0rsbf5ANh1EgIfOCQ2
 r3vGDLJXQsBF4n5zMkSNsMSr41ugvpGROD25B6q3WuLpjd/MEL0tjBL9O9ezQfRaS/SdyYG4
 M1Ni2/IdzBD1jhKP3syDGs8nceOtIEQJn8SkbdOhwrwSHW1CENVqEqvvvWGBCMtInPvEN4FR
 aRaSv2YhmQ9h60gs2P2JbRZQB7OAtMTyfxwQpqbE+l36CxhZVzGKp5YW56anFhvnpZbrFSfm
 Fpfmpesl5+duYgQmqtP/jn/dwbji1Ue9Q4xMHIyHGCU4mJVEeAP7klOEeFMSK6tSi/Lji0pz
 UosPMUpzsCiJ82rbnkwWEkhPLEnNTk0tSC2CyTJxcEo1MK1lmxc3R9Q9+XuP/obvdxOEDpXx
 mH/oXVcXsmpK1X3Zrikd17WmXWItOrRWKOmb3JyHx99sWSjlu2nPpvWXEqYa+Ck48/cvWLbu
 ob2Ayo1uhodiGzZ8lzeykn0z/cg3Hr2rLmpdXaL5T+Z//Fn8d2bXKbN9F9pu93gqxavm6f3a
 dtdu18oSexbHZvZU1rSvN0qWF56K3zvv9Pb9m0WnJjyJ0P69OnVm+8QFApUT2LbMYV6ZvKv2
 4/TtX8uVpHTeWD+bWmRTLrNInKd2+4WLCRPuO01uXt+SEq024+D6mlVfLc8mZrpPnKi1fMOP
 p3w7Nmt3ftfb47fn5T3WXrWqnTN82z5b7Yg8vPWRcvqJDJNkJZbijERDLeai4kQAZcYTJMMD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xe7rPX6SkGPxOsti2bje7xZz1a9gs
 Tq5+zGax4M1eNos9e0+yWNyY8JTRomt2K5vF7x9z2Bw4PDav0PLYtKqTzePEjN8sHu/3XWXz
 WL/lKovH501yAWxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZ
 ZalF+nYJehkNp16wFdxnrtjz7iprA2MzcxcjJ4eEgInEps7r7F2MXBxCAksZJfbveQeVkJHY
 +OUqK4QtLPHnWhcbRNFHRokne+exQDhbGCVenHvGBlLFIqAq8ePGXaAODg42AS2Jxk52kLCI
 gLHExOX7wZqZBRYwSXy9u5cRJCEskCRx5MteFhCbV8BcouHIZ7C4kEC2xM9ny5gh4oISJ2c+
 AathFtCRWLD7ExvIfGYBaYnl/zhAwpwC1hKLp71mgThUSaJh8xkou1ai89VptgmMwrOQTJqF
 ZNIshEkLGJlXMYqklhbnpucWG+oVJ+YWl+al6yXn525iBMbgtmM/N+9gnPfqo94hRiYOxkOM
 EhzMSiK8gX3JKUK8KYmVValF+fFFpTmpxYcYTYEhMZFZSjQ5H5gE8kriDc0MTA1NzCwNTC3N
 jJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamBZfviK43YJBVXPD/Ltnp7YGBEQePhR1iy29
 kpft5qQMY215m33lHMKO0tGXlOpW1yi9KXp/qn9mucrmq2zh5StOFaVXFESsamLftXFpdNgl
 kyBd73+xdeWrVSw2rfeTe+vRsEy56D3vtQhpPn6z8rCkI9rOXEuLv0Q8r91d0NydUDez98SO
 T55Vvnrhlfda2G8wbPspqPCDhWnG55SABIv7HCLtbktWeSZIsH3pdKo819L2Ys7Cjo8y1/t1
 3bhfZByc9HDa+clWTUs8dfjtMqdtPsV/g/tc1CrB4l9dL5Kumiw9IJJ76szbssthPnwdBqHc
 2Y2XMtKc7ZaH3A5l1wlt+GJw7xhf6qLQqWlKLMUZiYZazEXFiQC0cgohSgMAAA==
X-CMS-MailID: 20230517144703eucas1p1550db888e29fc5b182c202f24adddb87
X-Msg-Generator: CA
X-RootMTR: 20230517144703eucas1p1550db888e29fc5b182c202f24adddb87
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230517144703eucas1p1550db888e29fc5b182c202f24adddb87
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-5-willy@infradead.org>
 <CGME20230517144703eucas1p1550db888e29fc5b182c202f24adddb87@eucas1p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 4/6] buffer: Convert
 __block_write_full_page() to __block_write_full_folio()
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
Cc: p.raghav@samsung.com, Hannes Reinecke <hare@suse.com>,
 cluster-devel@redhat.com, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: multipart/mixed;
 boundary="----nt9vO67.b8K_looarrbd7-OVwn-OXfZhK5OxcWyp3fprDND4=_1c0ccd_"

------nt9vO67.b8K_looarrbd7-OVwn-OXfZhK5OxcWyp3fprDND4=_1c0ccd_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> @@ -1793,7 +1793,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
>  	blocksize = bh->b_size;
>  	bbits = block_size_bits(blocksize);
>  
> -	block = (sector_t)page->index << (PAGE_SHIFT - bbits);
> +	block = (sector_t)folio->index << (PAGE_SHIFT - bbits);

Shouldn't the PAGE_SHIFT be folio_shift(folio) as you allow larger
folios to be passed to this function in the later patches?

>  	last_block = (i_size_read(inode) - 1) >> bbits;
>  

------nt9vO67.b8K_looarrbd7-OVwn-OXfZhK5OxcWyp3fprDND4=_1c0ccd_
Content-Type: text/plain; charset="utf-8"


------nt9vO67.b8K_looarrbd7-OVwn-OXfZhK5OxcWyp3fprDND4=_1c0ccd_--

