Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4B74236A
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Jun 2023 11:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688031974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=JJ8A5RWcyl1scz/K2Ger4aToKVFg8VkiR1tPU5FsSag=;
	b=MR520Em4k3lvyHEXB2idoDlYxTTzPRi8VwSaKllk4tUoKESsyEeormYJcraIX5rDrGkdDI
	ykgSXk2bkqXItpS2WYQNe1dxrtBkyMaBLNxCxhdNYNSXrze9I3yQd8Okw2L+kz3G7TqClI
	bxC/nNQnAROyzkekXaIw41YBhgjcrmo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-XS5u_1NXMGmNdflkXaF-2w-1; Thu, 29 Jun 2023 05:46:12 -0400
X-MC-Unique: XS5u_1NXMGmNdflkXaF-2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7905E805C3F;
	Thu, 29 Jun 2023 09:46:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D462440C6CCD;
	Thu, 29 Jun 2023 09:46:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 680EE1946A47;
	Thu, 29 Jun 2023 09:46:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E5E461946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 28 Jun 2023 18:40:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 92D3F40C2070; Wed, 28 Jun 2023 18:40:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AA4440C206F
 for <cluster-devel@redhat.com>; Wed, 28 Jun 2023 18:40:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B5B32A59563
 for <cluster-devel@redhat.com>; Wed, 28 Jun 2023 18:40:51 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-x-ZjGyUvN0KmEzJQzDN8CA-1; Wed, 28 Jun 2023 14:40:49 -0400
X-MC-Unique: x-ZjGyUvN0KmEzJQzDN8CA-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B1F95C01EB;
 Wed, 28 Jun 2023 14:31:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 28 Jun 2023 14:31:43 -0400
X-ME-Sender: <xms:jnycZOn5OybT29WMh_8Nu9ecDEPN1h7jNycf-vrSJG1NrF7f_a7E3Q>
 <xme:jnycZF3a0uLL9Nn_QdK_G-Uu5Z_1ct7-X9r269tzvWdFuUQs4JBewHMnfnbcu7V29
 BeTMaKB3lVRrg>
X-ME-Received: <xmr:jnycZMrfEu_0c_E_bxkzG2rMKs3tlpQc2ebIIHujErcgxcu3QCmHQ6ELmPzEvdaQoAxiUPWgi4RCcwSBhLLztzFEhbqJknId78jnwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtddvgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:jnycZCkxNH-wDF4S8GsuoRaLIYpAdoLGMLcYcPdFm3RarK-buhbVdQ>
 <xmx:jnycZM2IcylwcT4JF01eg8J8ecSxO7Gev50i_0oOKHKwiA9GiPOvFg>
 <xmx:jnycZJsJ_NbAtXRxlp-4xnUw1BxFtfXL4gnSXUU8OLmBRpPW-BDNHw>
 <xmx:j3ycZCOW8r5Z8JC0TFCXrA5nn1fZS9VMXGJ5p4mKrPoCjy6Zjirlqw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jun 2023 14:31:42 -0400 (EDT)
Date: Wed, 28 Jun 2023 20:31:40 +0200
From: Greg KH <greg@kroah.com>
To: Dragos-Marian Panait <dragos.panait@windriver.com>
Message-ID: <2023062832-snuggle-casino-7f9e@gregkh>
References: <20230628133052.1796173-1-dragos.panait@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20230628133052.1796173-1-dragos.panait@windriver.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 29 Jun 2023 09:46:07 +0000
Subject: Re: [Cluster-devel] [PATCH 5.4] gfs2: Don't deref jdesc in evict
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 cluster-devel@redhat.com, Yang Lan <lanyang0908@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kroah.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 28, 2023 at 04:30:52PM +0300, Dragos-Marian Panait wrote:
> From: Bob Peterson <rpeterso@redhat.com>
> 
> [ Upstream commit 504a10d9e46bc37b23d0a1ae2f28973c8516e636 ]
> 
> On corrupt gfs2 file systems the evict code can try to reference the
> journal descriptor structure, jdesc, after it has been freed and set to
> NULL. The sequence of events is:
> 
> init_journal()
> ...
> fail_jindex:
>    gfs2_jindex_free(sdp); <------frees journals, sets jdesc = NULL
>       if (gfs2_holder_initialized(&ji_gh))
>          gfs2_glock_dq_uninit(&ji_gh);
> fail:
>    iput(sdp->sd_jindex); <--references jdesc in evict_linked_inode
>       evict()
>          gfs2_evict_inode()
>             evict_linked_inode()
>                ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
> <------references the now freed/zeroed sd_jdesc pointer.
> 
> The call to gfs2_trans_begin is done because the truncate_inode_pages
> call can cause gfs2 events that require a transaction, such as removing
> journaled data (jdata) blocks from the journal.
> 
> This patch fixes the problem by adding a check for sdp->sd_jdesc to
> function gfs2_evict_inode. In theory, this should only happen to corrupt
> gfs2 file systems, when gfs2 detects the problem, reports it, then tries
> to evict all the system inodes it has read in up to that point.
> 
> Reported-by: Yang Lan <lanyang0908@gmail.com>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> [DP: adjusted context]
> Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
> ---
>  fs/gfs2/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

All now queued up, thanks.

greg k-h

