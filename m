Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839B663BBA
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 09:51:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673340717;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nJ61wRnxFVUsYl9SFxC5eY+Tep9Kp5bIVHbU5IX3Up0=;
	b=ZRM0Rfl5tKn9iTrIhdfBqk1IqxFR8EzLUwozA3CqGDPQ7aSadme9Bz7ZiF7b9t/RhaW5PZ
	ZfMxqIWRkhFqI3cPEjxPUqmdXJD5Kd48a2w4ZvGsxzt8nqNnHL8HYWle+3lWOT3fVc/xBZ
	PWa9P6x8Erg8um9mlpj+XbEmSz+hKpM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-EgXRctBEMIOrrsDlb1bYAg-1; Tue, 10 Jan 2023 03:51:53 -0500
X-MC-Unique: EgXRctBEMIOrrsDlb1bYAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11EA287A381;
	Tue, 10 Jan 2023 08:51:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 034C440C2064;
	Tue, 10 Jan 2023 08:51:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6D23194037D;
	Tue, 10 Jan 2023 08:51:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1732A1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 08:51:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFDBB422FE; Tue, 10 Jan 2023 08:51:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D847F422F2
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 08:51:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B842F802D1A
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 08:51:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-b_ooOeRXMCqIU-t35TxDOg-1; Tue, 10 Jan 2023 03:51:48 -0500
X-MC-Unique: b_ooOeRXMCqIU-t35TxDOg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFAMD-005vJa-Ql; Tue, 10 Jan 2023 08:51:45 +0000
Date: Tue, 10 Jan 2023 00:51:45 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y70nIXBagWukaRVk@infradead.org>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20230108215911.GP1971568@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
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
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2023 at 08:59:11AM +1100, Dave Chinner wrote:
> Indeed, we also have this same "iomap valid check" functionality in the
> writeback code as cached iomaps can become stale due to racing
> writeback, truncated, etc. But you wouldn't know it by looking at the iomap
> writeback code - this is currently hidden by XFS by embedding
> the checks into the iomap writeback ->map_blocks function.

And that's in many ways a good thing, as it avoids various callouts
that are expensive and confusing.  Just like how this patch gets it
right by not having a mess of badly interacting callbacks, but
one that ensures that the page is ready.

> Hence I think removing ->iomap_valid is a big step backwards for the
> iomap core code - the iomap core needs to be able to formally verify
> the iomap is valid at any point in time, not just at the point in
> time a folio in the page cache has been locked...

For using it anywhere else but the buffered write path it is in the
wrong place to start with, and nonwithstanding my above concern I
can't relaly think of a good place and prototype for such a valid
callback to actually cover all use cases.

