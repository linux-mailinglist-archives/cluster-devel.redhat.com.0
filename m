Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6506DE978
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Apr 2023 04:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681266827;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=M7cvxi4mXz5zjzi4JIBZ0G/0ou83kWE466Fx7kWGv6I=;
	b=PIt505hVQs6lO3v2PLVpaxlOcFymQJDIcsKnOxvCqcWITp0hfA4ybetH3eJvBKVa0C8tqH
	oRZMlpNdrsGIDqv+SXHvk7a8Aw/RBMh0dZgRUtqn+kKOTJBx8lYYv+72lbsEm3BVcM5oBR
	vCtoKbX0sUTetyxoXp/KBeQm0teUFNk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-znmf-CC-Nda61jJlQiw99g-1; Tue, 11 Apr 2023 22:33:37 -0400
X-MC-Unique: znmf-CC-Nda61jJlQiw99g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73F9F1C041B6;
	Wed, 12 Apr 2023 02:33:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1201740C83A9;
	Wed, 12 Apr 2023 02:33:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D9EC81946A46;
	Wed, 12 Apr 2023 02:33:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CD31819466DF for <cluster-devel@listman.corp.redhat.com>;
 Wed, 12 Apr 2023 02:33:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A3A52166B31; Wed, 12 Apr 2023 02:33:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E112166B30
 for <cluster-devel@redhat.com>; Wed, 12 Apr 2023 02:33:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02F0085A5A3
 for <cluster-devel@redhat.com>; Wed, 12 Apr 2023 02:33:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-xMKkc0AsMOW0v8J2OoWx1Q-1; Tue, 11 Apr 2023 22:33:23 -0400
X-MC-Unique: xMKkc0AsMOW0v8J2OoWx1Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2265560FA2;
 Wed, 12 Apr 2023 02:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F370C433D2;
 Wed, 12 Apr 2023 02:33:21 +0000 (UTC)
Date: Tue, 11 Apr 2023 19:33:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20230412023319.GA5105@sol.localdomain>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZDTt8jSdG72/UnXi@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: fsverity@lists.linux.dev, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 10, 2023 at 10:19:46PM -0700, Christoph Hellwig wrote:
> Dave is going to hate me for this, but..
> 
> I've been looking over some of the interfaces here, and I'm starting
> to very seriously questioning the design decisions of storing the
> fsverity hashes in xattrs.
> 
> Yes, storing them beyond i_size in the file is a bit of a hack, but
> it allows to reuse a lot of the existing infrastructure, and much
> of fsverity is based around it.  So storing them in an xattrs causes
> a lot of churn in the interface.  And the XFS side with special
> casing xattr indices also seems not exactly nice.

It seems it's really just the Merkle tree caching interface that is causing
problems, as it's currently too closely tied to the page cache?  That is just an
implementation detail that could be reworked along the lines of what is being
discussed.

But anyway, it is up to the XFS folks.  Keep in mind there is also the option of
doing what btrfs is doing, where it stores the Merkle tree separately from the
file data stream, but caches it past i_size in the page cache at runtime.

I guess there is also the issue of encryption, which hasn't come up yet since
we're talking about fsverity support only.  The Merkle tree (including the
fsverity_descriptor) is supposed to be encrypted, just like the file contents
are.  Having it be stored after the file contents accomplishes that easily...
Of course, it doesn't have to be that way; a separate key could be derived, or
the Merkle tree blocks could be encrypted with the file contents key using
indices past i_size, without them physically being stored in the data stream.

- Eric

