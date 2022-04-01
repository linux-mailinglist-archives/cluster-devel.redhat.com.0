Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EB34EE7C3
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Apr 2022 07:30:54 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-C0L7edPtO5STrhRTsEu_qw-1; Fri, 01 Apr 2022 01:30:48 -0400
X-MC-Unique: C0L7edPtO5STrhRTsEu_qw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8394929AB44B;
	Fri,  1 Apr 2022 05:30:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FDCE7AD5;
	Fri,  1 Apr 2022 05:30:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3AF2C1949761;
	Fri,  1 Apr 2022 05:30:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 096B11947BBC for <cluster-devel@listman.corp.redhat.com>;
 Fri,  1 Apr 2022 05:30:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E09AC140241B; Fri,  1 Apr 2022 05:30:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCC5B1400B18
 for <cluster-devel@redhat.com>; Fri,  1 Apr 2022 05:30:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 842CA3C11C70
 for <cluster-devel@redhat.com>; Fri,  1 Apr 2022 05:30:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-gHPc_mO-NXm57uWZQFUUjg-1; Fri, 01 Apr 2022 01:30:42 -0400
X-MC-Unique: gHPc_mO-NXm57uWZQFUUjg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1na9Az-004Tk9-PQ; Fri, 01 Apr 2022 04:46:21 +0000
Date: Thu, 31 Mar 2022 21:46:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Message-ID: <YkaDnfLS8T0HszoV@infradead.org>
References: <20220401033755.1892644-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20220401033755.1892644-1-jiasheng@iscas.ac.cn>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] gfs2: Add check for mempool_alloc
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 01, 2022 at 11:37:55AM +0800, Jiasheng Jiang wrote:
> >> Fixes: e8c92ed76900 ("GFS2: Clean up log write code path")
> >> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > 
> > Please explain how it could fail to start with.
> 
> I think that for safety, the cost of redundant and harmless
> check is acceptable.
> Also, checking after allocation is a good program pattern.
> Therefore, it should be better to check it although it is
> hard to fail.

Please take a look at the implemetation and documentation of
mempool_alloc again.  Thewhole point of that function is that it will
not fail for allocations that can sleep.

