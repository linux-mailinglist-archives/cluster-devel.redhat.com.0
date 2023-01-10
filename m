Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B8663CC5
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 10:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673342749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=usc4kPYlRKM7CFqadqNB7LyLIDZhCAK3LME1O0ZEeRg=;
	b=BT6DaRMSzH4z00ZN0sdQmNLINxaFcdFM7ET4i7WNucN8mMTCYI/Tr4nThlVhom2dydvZu/
	YYZalgUkN/C4+rMisZHFWCVx6wf+iq09l96XRuQFfGWr43ntahjuu2cSdvOG7wweP1g6ed
	H5pr130F3FekhNDzIg0BNXczQ1BiiTw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-WuxD_SoCMz-h_AUj63Xdnw-1; Tue, 10 Jan 2023 04:25:46 -0500
X-MC-Unique: WuxD_SoCMz-h_AUj63Xdnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27220857F41;
	Tue, 10 Jan 2023 09:25:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D59572026D68;
	Tue, 10 Jan 2023 09:25:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A12B9193F512;
	Tue, 10 Jan 2023 09:25:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8B06193F504 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 09:25:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7EDE140C1141; Tue, 10 Jan 2023 09:25:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76D38401530A
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 09:25:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B24D1C0878A
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 09:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-502-pO3qTUKTMHav3sU1oHOoiA-1; Tue, 10 Jan 2023 04:25:29 -0500
X-MC-Unique: pO3qTUKTMHav3sU1oHOoiA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFAHN-005tNC-St; Tue, 10 Jan 2023 08:46:45 +0000
Date: Tue, 10 Jan 2023 00:46:45 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y70l9ZZXpERjPqFT@infradead.org>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230109124642.1663842-1-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2023 at 01:46:42PM +0100, Andreas Gruenbacher wrote:
> We can handle that by adding a new IOMAP_NOCREATE iterator flag and
> checking for that in iomap_get_folio().  Your patch then turns into
> the below.

Exactly.  And as I already pointed out in reply to Dave's original
patch what we really should be doing is returning an ERR_PTR from
__filemap_get_folio instead of reverse-engineering the expected
error code.

The only big question is if we should apply Dave's patch first as a bug
fix before this series, and I suspect we should do that.

