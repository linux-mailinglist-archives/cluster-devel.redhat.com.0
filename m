Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EFE664489
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 16:24:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673364280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oNTdMR+VSzbfWekKWcdjtSu/K0LW9KTEw3USctOnxiU=;
	b=SuCWM6/MhtckOs2s+Gd90Wad0yZDOGqdDdNQ7Q4j+yrlkxNC+MW3sBk2bivrq7WqwZoEoH
	DbrxTdYKJXO8bPcUnT1IvehRbObu6tbY4a5gQHw4lgg3Xzc5/zDl9Bi3nOPuatJ2PZIj+7
	0X6VJiDGagdHisQidBb5DCPgi1dPhZg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ZgI80bW2MlS0ZA1Ys7SJsw-1; Tue, 10 Jan 2023 10:24:39 -0500
X-MC-Unique: ZgI80bW2MlS0ZA1Ys7SJsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 730073C025C0;
	Tue, 10 Jan 2023 15:24:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19B59140EBF6;
	Tue, 10 Jan 2023 15:24:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6831194E117;
	Tue, 10 Jan 2023 15:24:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7CF31946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 15:24:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A55CB492C18; Tue, 10 Jan 2023 15:24:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DA99492C14
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 15:24:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 816D0101A55E
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 15:24:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-xQ5M8C3ZMCWUMWfLsGerhA-1; Tue, 10 Jan 2023 10:24:30 -0500
X-MC-Unique: xQ5M8C3ZMCWUMWfLsGerhA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFGUF-007Yt2-4o; Tue, 10 Jan 2023 15:24:27 +0000
Date: Tue, 10 Jan 2023 07:24:27 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Y72DK9XuaJfN+ecj@infradead.org>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
 <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2023 at 01:34:16PM +0000, Matthew Wilcox wrote:
> > Exactly.  And as I already pointed out in reply to Dave's original
> > patch what we really should be doing is returning an ERR_PTR from
> > __filemap_get_folio instead of reverse-engineering the expected
> > error code.
> 
> Ouch, we have a nasty problem.
> 
> If somebody passes FGP_ENTRY, we can return a shadow entry.  And the
> encodings for shadow entries overlap with the encodings for ERR_PTR,
> meaning that some shadow entries will look like errors.  The way I
> solved this in the XArray code is by shifting the error values by
> two bits and encoding errors as XA_ERROR(-ENOMEM) (for example).
> 
> I don't _object_ to introducing XA_ERROR() / xa_err() into the VFS,
> but so far we haven't, and I'd like to make that decision intentionally.

So what would be an alternative way to tell the callers why no folio
was found instead of trying to reverse engineer that?  Return an errno
and the folio by reference?  The would work, but the calling conventions
would be awful.

