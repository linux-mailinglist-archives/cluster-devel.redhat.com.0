Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E07710A87
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 13:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685012723;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9Q+kM+TWjxXk+Cj89CRyijYjxLbQDo47dz+5qnhLfMA=;
	b=Scrvvv7XYgYQkTjK9EJpisvGkhxq+rTXc3Rq9ZwE2iG86nn8OLz0WJ929U2JYt6xE14Bmf
	qDsPAM6GbflkSHB+cNyLDkqXrA0BUJtgrokoNUp28hTltWBRA4hIMtSnHaIL6lIJu5d91/
	uL45K0KmlGlN1x0bdyLrqfj3n6jXJNo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-vGoVlMsDP2aK-zqth_zA7w-1; Thu, 25 May 2023 07:05:20 -0400
X-MC-Unique: vGoVlMsDP2aK-zqth_zA7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A407101A53A;
	Thu, 25 May 2023 11:05:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E82E27AF5;
	Thu, 25 May 2023 11:05:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F4D919465B2;
	Thu, 25 May 2023 11:05:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9CAF619465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 10:06:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 38FA6401026; Thu, 25 May 2023 10:06:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31120492B00
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 10:06:08 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13F2129AA38F
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 10:06:08 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-56p_X0A2MhmPYCHA7CAmbw-1; Thu, 25 May 2023 06:06:04 -0400
X-MC-Unique: 56p_X0A2MhmPYCHA7CAmbw-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45E6C68AFE; Thu, 25 May 2023 12:05:58 +0200 (CEST)
Date: Thu, 25 May 2023 12:05:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20230525100557.GA30242@lst.de>
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-10-hch@lst.de>
 <CAJfpeguT-LjhS-XrZwMystZqkxyB=HaON1zo-BTNOC0L1zCa1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpeguT-LjhS-XrZwMystZqkxyB=HaON1zo-BTNOC0L1zCa1Q@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 09/11] fs: factor out a
 direct_write_fallback helper
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 09:00:36AM +0200, Miklos Szeredi wrote:
> > +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
> > +               ssize_t direct_written, ssize_t buffered_written)
> > +{
> > +       struct address_space *mapping = iocb->ki_filp->f_mapping;
> > +       loff_t pos = iocb->ki_pos - buffered_written;
> > +       loff_t end = iocb->ki_pos - 1;
> > +       int err;
> > +
> > +       /*
> > +        * If the buffered write fallback returned an error, we want to return
> > +        * the number of bytes which were written by direct I/O, or the error
> > +        * code if that was zero.
> > +        *
> > +        * Note that this differs from normal direct-io semantics, which will
> > +        * return -EFOO even if some bytes were written.
> > +        */
> > +       if (unlikely(buffered_written < 0))
> > +               return buffered_written;
> 
> Comment/code mismatch.   The comment says:
> 
> if (buffered_written < 0)
>         return direct_written ?: buffered_written;

Yeah.  And the old code matches the comment, so I'll update to that.
I'm really wondering how I could come up with a good test case for
this..

