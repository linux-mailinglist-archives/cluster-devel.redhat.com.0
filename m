Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5A6B213B
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 11:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678357308;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5Ir/h645vG7/3e7LKCiTYw/Yo812wpfTRDoEn9ipx+Q=;
	b=LdtorwXLuHh106o0JLhUFguc4GtiQYvHnO8fdSWftU469MPG11jUPAUnPfnBPPj2K8D5jc
	mth3aLjNaNc/EQlzRlvC8ew1nbmEX3FY1bB5+geFO96lDjh7fMFUBnZdrmnjJzLy2KOVd1
	opbsZW8FYKQgv85PQjCNc27qGoZpqao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-GNn_ts2YPWSwrv5j6RNVeA-1; Thu, 09 Mar 2023 05:21:44 -0500
X-MC-Unique: GNn_ts2YPWSwrv5j6RNVeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89E553C0F193;
	Thu,  9 Mar 2023 10:21:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B8A14010E7B;
	Thu,  9 Mar 2023 10:21:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5BE51946A4A;
	Thu,  9 Mar 2023 10:21:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2492F19465B5 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 10:21:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BDD72492B00; Thu,  9 Mar 2023 10:21:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B70F4492C3E
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 10:21:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BB913810B00
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 10:21:40 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-vzA4txlGPl-_vhdhpBqy6A-1; Thu, 09 Mar 2023 05:21:39 -0500
X-MC-Unique: vzA4txlGPl-_vhdhpBqy6A-1
Received: by mail-pf1-f198.google.com with SMTP id
 f14-20020a056a00228e00b005e46dd41b67so975116pfe.8
 for <cluster-devel@redhat.com>; Thu, 09 Mar 2023 02:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678357295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ir/h645vG7/3e7LKCiTYw/Yo812wpfTRDoEn9ipx+Q=;
 b=DCmU8wouXw9lDvidI2ciiNA3aO9N8cergXD1Uphx1u+K7Si2TMiDDht+nIovjPSvpJ
 Z5ftWfCj+n68fAWrNf8eaexz+z8ZNIdyLA4JBzoR1ADiiLHIkL0sdhXSzbA4G9aKEmYB
 ac9ovDCZBjAV74yP8TXti3+3bQ6ziW2Rz2cxRaO0Fxc81u70/YKPDv0mu1FiliepA9IK
 +9Oil6c+S1tCCShG3uk7dnPugn4AKiudz//agDPyxLkkiDekQPWh9SYmkiyUnR++jh1i
 hsPi/WsTlxwGF1oscdZU5jazn4l2jEMvfDW55itlLFpbS2DikScQjpMDFJq7qnEL/TKl
 5udQ==
X-Gm-Message-State: AO0yUKUB2G4KFQ/RXrpah5LFJeQ3QzaGNEgIc8rGXLiHccfOe9Hiez6l
 gI8uQ31w12lvH2isuQ+d1XyJuDqEmB3FT81uG5+JrBABHlC+ITQf0tViQg0nftbQ/6e3eukJGio
 Q9r/p9ETqrb+NIaGhUWZ+hyuX5NElDOeEjYuO3g==
X-Received: by 2002:a17:902:f7c1:b0:19c:a3be:a4f3 with SMTP id
 h1-20020a170902f7c100b0019ca3bea4f3mr8229326plw.4.1678357295486; 
 Thu, 09 Mar 2023 02:21:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9VDTf99mRyC2eJOBxIkMspHxJ2pV++2lzfcL1yIkpa4x+m9xdxgNtT/wUdeXHjX/qKTQaaMK9Wp7kJK/Zrno4=
X-Received: by 2002:a17:902:f7c1:b0:19c:a3be:a4f3 with SMTP id
 h1-20020a170902f7c100b0019ca3bea4f3mr8229321plw.4.1678357295164; Thu, 09 Mar
 2023 02:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20230309094317.69773-1-frank.li@vivo.com>
In-Reply-To: <20230309094317.69773-1-frank.li@vivo.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 9 Mar 2023 11:21:23 +0100
Message-ID: <CAHc6FU7vGD9NGn0phJsLEmcU8O7AaBS+hm=AEwYOc0nFGHS-hQ@mail.gmail.com>
To: Yangtao Li <frank.li@vivo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 1/4] fs: add i_blocksize_mask()
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
Cc: brauner@kernel.org, tytso@mit.edu, chao@kernel.org,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com, huyue2@coolpad.com,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, xiang@kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2023 at 10:43=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wrot=
e:
> Introduce i_blocksize_mask() to simplify code, which replace
> (i_blocksize(node) - 1). Like done in commit
> 93407472a21b("fs: add i_blocksize()").

I would call this i_blockmask().

Note that it could be used in ocfs2_is_io_unaligned() as well.

>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  include/linux/fs.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index c85916e9f7db..db335bd9c256 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -711,6 +711,11 @@ static inline unsigned int i_blocksize(const struct =
inode *node)
>         return (1 << node->i_blkbits);
>  }
>
> +static inline unsigned int i_blocksize_mask(const struct inode *node)
> +{
> +       return i_blocksize(node) - 1;
> +}
> +
>  static inline int inode_unhashed(struct inode *inode)
>  {
>         return hlist_unhashed(&inode->i_hash);
> --
> 2.25.1
>

Thanks,
Andreas

