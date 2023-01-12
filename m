Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FDD666DE5
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 10:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673515005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HhzoXJd8QLSlSJS1DqxUvN7zM6XlenXjXRqQOg3se84=;
	b=GJMkoOATPVW6LjlvDEzKNOBNp6ETtdgn3ZKhnkEjhOR+Sv8fUYJ7CDrJW+EOEqQVVwNz8M
	Ci3XdvtRzmViwBpigLUBrpLXNvvHEojsuA0Lk54pTrYOLJlM3SebmqK33HYbJ/T6mm4A3x
	jaa6DMLixSDeAiXrNLZjh5/g4Gw5cVY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-Yex7zaHkMDmZVUaLP-R0uQ-1; Thu, 12 Jan 2023 04:16:41 -0500
X-MC-Unique: Yex7zaHkMDmZVUaLP-R0uQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E87A38060FE;
	Thu, 12 Jan 2023 09:16:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04D7039DB3;
	Thu, 12 Jan 2023 09:16:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 950941947047;
	Thu, 12 Jan 2023 09:16:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A24CE1946A78 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 09:16:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B0B7492B01; Thu, 12 Jan 2023 09:16:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63745492B02
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 09:16:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49C3E877CA0
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 09:16:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-flPpjYvnPR2wQSav3ipyqw-1; Thu, 12 Jan 2023 04:16:32 -0500
X-MC-Unique: flPpjYvnPR2wQSav3ipyqw-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFt9B-00EALM-Ff; Thu, 12 Jan 2023 08:41:17 +0000
Date: Thu, 12 Jan 2023 00:41:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y7/HrZCARD9zRvEe@infradead.org>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
 <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
 <Y72DK9XuaJfN+ecj@infradead.org>
 <Y78PunroeYbv2qgH@casper.infradead.org>
 <20230111205241.GA360264@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20230111205241.GA360264@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 12, 2023 at 07:52:41AM +1100, Dave Chinner wrote:
> Exposing internal implementation details in the API
> that is supposed to abstract away the internal implementation
> details from users doesn't seem like a great idea to me.

While I somewhat agree with the concern of leaking the xarray
internals, at least they are clearly documented and easy to find..

> Exactly what are we trying to fix here?  Do we really need to punch
> a hole through the abstraction layers like this just to remove half
> a dozen lines of -slow path- context specific error handling from a
> single caller?

While the current code (which is getting worse with your fix) leaks
completely undocumented and internal decision making.  So what this
fixes is a real leak of internatal logic inside of __filemap_get_folio
into the callers.

So as far as I'm concerned we really do need the helper, and anyone
using !GFP_CREATE or FGP_NOWAIT should be using it.  The only question
to me is if exposing the xarray internals is worth it vs the
less optimal calling conventions of needing an extra argument for
the error code.

