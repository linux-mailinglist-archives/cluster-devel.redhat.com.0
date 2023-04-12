Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B116DE9D9
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Apr 2023 05:18:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681269521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QTzf86zAv2fU3C/eN/0tX6Qjb72nN2ZOHZq+wIvYYEk=;
	b=MbmLHWbUojH6p2DU3FM5UMWBrw+T46ybzTQ0bZZj++Ltyoa8aS7snrlk1OEINp+FB6sRSm
	cjunNSnHJSiDvOrsJ7rokIJLToM3q4v0MiWKfvQ3C2kRpCCUiC6o5LfiLvpqNVstR0aMBt
	KTyIvxLN0QRIIt9F2Wl3wpRVCn2Jntw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-LoSol6VONRiS24DGS8oTEA-1; Tue, 11 Apr 2023 23:18:38 -0400
X-MC-Unique: LoSol6VONRiS24DGS8oTEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCCDA85C6E0;
	Wed, 12 Apr 2023 03:18:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D4F6492C13;
	Wed, 12 Apr 2023 03:18:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF47C1946A46;
	Wed, 12 Apr 2023 03:18:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7797719466DF for <cluster-devel@listman.corp.redhat.com>;
 Wed, 12 Apr 2023 03:18:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 49B5640BC798; Wed, 12 Apr 2023 03:18:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4278940BC797
 for <cluster-devel@redhat.com>; Wed, 12 Apr 2023 03:18:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27BB185A588
 for <cluster-devel@redhat.com>; Wed, 12 Apr 2023 03:18:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-LnAgoRHqOU-K511hGfb2Dw-1; Tue, 11 Apr 2023 23:18:31 -0400
X-MC-Unique: LnAgoRHqOU-K511hGfb2Dw-1
Received: by mail-pl1-f171.google.com with SMTP id q2so14885579pll.7
 for <cluster-devel@redhat.com>; Tue, 11 Apr 2023 20:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681269510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTzf86zAv2fU3C/eN/0tX6Qjb72nN2ZOHZq+wIvYYEk=;
 b=PiMgcwTWSlTXGoQYILfnUsgq+V4cw5ERKX4EUPvjVX9KaVtE3cZ4ULY85oUOF1g55M
 2aNKYm0Kwuf/iwAmXU6zbsjoRo/BwtkVLp40Crl+gi83iHYDdI3i+ZL0EJ8Dg3q3J+bE
 tJ77hx7RaZ5/GeZ99DKaBqeQj3snYqH7jJWnzanWTjbq5YzODPdF3W+8OcVY5dQTYq+b
 hFnt34p8LFse2/OEqwMwYxuMINuUxk35Xlyj8MAy8KfF1f8Jw+GYRGYO5Fri30beWuLO
 mqS63/gu/LJQSSV7UfKQpEZKBeQCTnpZm4EAq1Q9iPw3hoSxcyOZoapJ1mreNSbu7kkG
 E2OA==
X-Gm-Message-State: AAQBX9fRzp0OYWKqDFoK/8xGLY6vI6B0hZ/3CarZhCfMHHa7vfJLSrgn
 pjXNkZxtnrsdKzV4JV4GTl+r5w==
X-Google-Smtp-Source: AKy350bEvRaL0tcbYZNXJN9S8MKTlfNUtm72wryf0f0tx94/6m3Gotj2MFJG8+gujGf5Bd9bxftN0Q==
X-Received: by 2002:a17:90a:45:b0:23f:a4da:1203 with SMTP id
 5-20020a17090a004500b0023fa4da1203mr6850168pjb.19.1681269510087; 
 Tue, 11 Apr 2023 20:18:30 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-41-174.pa.nsw.optusnet.com.au.
 [49.180.41.174]) by smtp.gmail.com with ESMTPSA id
 z8-20020a1709028f8800b0019f9fd5c24asm7362321plo.207.2023.04.11.20.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 20:18:29 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pmR06-002L8o-E9; Wed, 12 Apr 2023 13:18:26 +1000
Date: Wed, 12 Apr 2023 13:18:26 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230412031826.GI3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
 <20230412023319.GA5105@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230412023319.GA5105@sol.localdomain>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 11, 2023 at 07:33:19PM -0700, Eric Biggers wrote:
> On Mon, Apr 10, 2023 at 10:19:46PM -0700, Christoph Hellwig wrote:
> > Dave is going to hate me for this, but..
> > 
> > I've been looking over some of the interfaces here, and I'm starting
> > to very seriously questioning the design decisions of storing the
> > fsverity hashes in xattrs.
> > 
> > Yes, storing them beyond i_size in the file is a bit of a hack, but
> > it allows to reuse a lot of the existing infrastructure, and much
> > of fsverity is based around it.  So storing them in an xattrs causes
> > a lot of churn in the interface.  And the XFS side with special
> > casing xattr indices also seems not exactly nice.
> 
> It seems it's really just the Merkle tree caching interface that is causing
> problems, as it's currently too closely tied to the page cache?  That is just an
> implementation detail that could be reworked along the lines of what is being
> discussed.
> 
> But anyway, it is up to the XFS folks.  Keep in mind there is also the option of
> doing what btrfs is doing, where it stores the Merkle tree separately from the
> file data stream, but caches it past i_size in the page cache at runtime.

Right. It's not entirely simple to store metadata on disk beyond EOF
in XFS because of all the assumptions throughout the IO path and
allocator interfaces that it can allocate space beyond EOF at will
and something else will clean it up later if it is not needed. This
impacts on truncate, delayed allocation, writeback, IO completion,
EOF block removal on file close, background garbage collection,
ENOSPC/EDQUOT driven space freeing, etc.  Some of these things cross
over into iomap infrastructure, too.

AFAIC, it's far more intricate, complex and risky to try to store
merkle tree data beyond EOF than it is to put it in an xattr
namespace because IO path EOF handling bugs result in user data
corruption. This happens over and over again, no matter how careful
we are about these aspects of user data handling.

OTOH, putting the merkle tree data in a different namespace avoids
these issues completely. Yes, we now have to solve an API mismatch,
but we aren't risking the addition of IO path data corruption bugs
to every non-fsverity filesystem in production...

Hence I think copying the btrfs approach (i.e. only caching the
merkle tree data in the page cache beyond EOF) would be as far as I
think we'd want to go. Realistically, there would be little
practical difference between btrfs storing the merkle tree blocks in
a separate internal btree and XFS storing them in an internal
private xattr btree namespace.

I would, however, prefer not to have to do this at all if we could
simply map the blocks directly out of the xattr buffers as we
already do internally for all the XFS code...

> I guess there is also the issue of encryption, which hasn't come up yet since
> we're talking about fsverity support only.  The Merkle tree (including the
> fsverity_descriptor) is supposed to be encrypted, just like the file contents
> are.  Having it be stored after the file contents accomplishes that easily...
> Of course, it doesn't have to be that way; a separate key could be derived, or
> the Merkle tree blocks could be encrypted with the file contents key using
> indices past i_size, without them physically being stored in the data stream.

I'm expecting that fscrypt for XFS will include encryption of the
xattr names and values (just like we will need to do for directory
names) except for the xattrs that hold the encryption keys
themselves. That means the merkle tree blocks should get encrypted
without any extra work needing to be done anywhere.  This will
simply require the fscrypt keys to be held in a private internal
xattr namespace that isn't encrypted, but that's realtively trivial
to do...

Cheers,

Dave.

-- 
Dave Chinner
david@fromorbit.com

