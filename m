Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55F762844
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 03:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690335597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=;
	b=Y0e7pjZeD4Xfsax/w3u4QKE3L2tM6SkxcpNWRXoMUgcAqZ3fq/qVpk/dH8gH3yKx9LI4Hm
	R5UGSk1w0xlzk9qf2o/nTUE07n0F/iA/jqT6hRI2zkmCQk7QxSOJIe/sW+xrSmu+l6sev+
	OFFrI7HHfn6y1aJQkedMDNcJOXNybE4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-xLCuL2_2MEeJ1SlM-JOHnw-1; Tue, 25 Jul 2023 21:39:53 -0400
X-MC-Unique: xLCuL2_2MEeJ1SlM-JOHnw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35E9688D541;
	Wed, 26 Jul 2023 01:39:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DC0346A3A7;
	Wed, 26 Jul 2023 01:39:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E6D41946A41;
	Wed, 26 Jul 2023 01:39:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7D0C19465B9 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 01:39:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C7CF4094DC1; Wed, 26 Jul 2023 01:39:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C074094DC0
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 01:39:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 751D1380391C
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 01:39:42 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-EmF1ygsCO9WFXyE0Sv-aZA-1; Tue, 25 Jul 2023 21:39:38 -0400
X-MC-Unique: EmF1ygsCO9WFXyE0Sv-aZA-1
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-583b3aa4f41so47257887b3.2
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 18:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690335578; x=1690940378;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=;
 b=OJcNHV3ymrK/baJuX951l/9wFhzuJNW1sCZuQopESf/S/Ws7bCMEPD8MW/tMVdYsew
 B601i+cDyWPhH0vEzPWFaRATILO6h8G7/5I6Rl0mPwfhBXTuXPa7Zo/w/KhZFgq0bVXe
 hRelwhQ/8ry5Fb9Hr6/J+0Ued3JYl7Q2kDTJWg/Ulv+ZDRVbzKCjxUFBPgszzZ2Psxtz
 7u1h7bQFcfLKpETKPdNtgjx4GZXuj6r4xBgtl2nNEQgccfESNfNYwiQ56uc1okp5pskG
 4ayPpRV2GsdM1zw8eLxUro0ASSdqYe0NY7N2oUCTUC4ribc8LgE7wabHP5lWrvedDpzg
 5+3A==
X-Gm-Message-State: ABy/qLaafKUdbriFzjbfxeXC4CQWZGNvDwLkusnY4RYbsal4yjQNq0gV
 ycWv3W6lawfFtJtJ/4wM8TN3yg==
X-Google-Smtp-Source: APBJJlHxqCs0/k9opPHZr1oFjC/IjLn2NWFjtEyuaFY5bDdVyDOg3sTAz2vkUnxY9z5liUX1UEynKA==
X-Received: by 2002:a81:46c3:0:b0:56d:2189:d87a with SMTP id
 t186-20020a8146c3000000b0056d2189d87amr821699ywa.15.1690335578030; 
 Tue, 25 Jul 2023 18:39:38 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a5b044a000000b00c654cc439fesm3165326ybp.52.2023.07.25.18.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 18:39:37 -0700 (PDT)
Date: Tue, 25 Jul 2023 18:39:25 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
Message-ID: <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v6 3/7] tmpfs: bump the
 mtime/ctime/iversion when page becomes writeable
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, linux-f2fs-devel@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Anthony Iliopoulos <ailiop@suse.com>, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jul 2023, Jeff Layton wrote:

> Most filesystems that use the pagecache will update the mtime, ctime,
> and change attribute when a page becomes writeable. Add a page_mkwrite
> operation for tmpfs and just use it to bump the mtime, ctime and change
> attribute.
> 
> This fixes xfstest generic/080 on tmpfs.

Huh.  I didn't notice when this one crept into the multigrain series.

I'm inclined to NAK this patch: at the very least, it does not belong
in the series, but should be discussed separately.

Yes, tmpfs does not and never has used page_mkwrite, and gains some
performance advantage from that.  Nobody has ever asked for this
change before, or not that I recall.

Please drop it from the series: and if you feel strongly, or know
strong reasons why tmpfs suddenly needs to use page_mkwrite now,
please argue them separately.  To pass generic/080 is not enough.

Thanks,
Hugh

> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  mm/shmem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b154af49d2df..654d9a585820 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct inode *inode = file_inode(vma->vm_file);
> +
> +	file_update_time(vma->vm_file);
> +	inode_inc_iversion(inode);
> +	return 0;
> +}
> +
>  unsigned long shmem_get_unmapped_area(struct file *file,
>  				      unsigned long uaddr, unsigned long len,
>  				      unsigned long pgoff, unsigned long flags)
> @@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops = {
>  
>  static const struct vm_operations_struct shmem_vm_ops = {
>  	.fault		= shmem_fault,
> +	.page_mkwrite	= shmem_page_mkwrite,
>  	.map_pages	= filemap_map_pages,
>  #ifdef CONFIG_NUMA
>  	.set_policy     = shmem_set_policy,
> @@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm_ops = {
>  
>  static const struct vm_operations_struct shmem_anon_vm_ops = {
>  	.fault		= shmem_fault,
> +	.page_mkwrite	= shmem_page_mkwrite,
>  	.map_pages	= filemap_map_pages,
>  #ifdef CONFIG_NUMA
>  	.set_policy     = shmem_set_policy,
> 
> -- 
> 2.41.0

