Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9470B31F
	for <lists+cluster-devel@lfdr.de>; Mon, 22 May 2023 04:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684722079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pl1j2Mo02M1sQGfGs/DUFoRb8smUY2ZG1V4PFyySeOU=;
	b=b/C85J6rWs/fAUNvsEdWdm5I4kQPABtI+akJUjffdwZbn//uk7qtzQ7UYx9oCwMcTxu0at
	c+ZmF3JUocIPUtD4lcF8kvXuVBd+bnTWHtWQa/cuNR60ctL5IjPqosZYY3edOf9Y4HW6SL
	DuKLICnj74QL0fiMZEi/y7CQLnzolro=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-uC2tcmOePYq-V0TIrUGWIw-1; Sun, 21 May 2023 22:21:17 -0400
X-MC-Unique: uC2tcmOePYq-V0TIrUGWIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82A3E29AB44A;
	Mon, 22 May 2023 02:21:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFF7040C6CCF;
	Mon, 22 May 2023 02:21:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A625F19465A2;
	Mon, 22 May 2023 02:21:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 47002194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 22 May 2023 02:21:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B86340C6CCF; Mon, 22 May 2023 02:21:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 245FA40C6CD9
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 02:21:14 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 086FC185A791
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 02:21:14 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-qn-kCbbAOomhoWpOqTBsOg-1; Sun, 21 May 2023 22:21:11 -0400
X-MC-Unique: qn-kCbbAOomhoWpOqTBsOg-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-51b49840df8so2969993a12.2
 for <cluster-devel@redhat.com>; Sun, 21 May 2023 19:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684722070; x=1687314070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pl1j2Mo02M1sQGfGs/DUFoRb8smUY2ZG1V4PFyySeOU=;
 b=S3tse+3xH2G2HMff9FpWGML1WacUtCPDqg431EY9WfADKZ06D24WNCH18oIs5ppvST
 +TAfTGIMuPt1qE5YcaiRPNhaFHs0RH+sb3K3kjMOSN2hvu96gxqVR85RkvXxnxEr5Fkg
 U/ZzfgaKc7uc0s4dlqaZoHPvMpUi7HqBoqSiPwZwqxeJAyt98MQKssqRqeM8VlKfILdz
 auvIrOVV9G+m6JPAi4NWNxkS/I5QF4Wns1j8cbCIgSDUHfUPdCKC8WhWb8JRFObRFZai
 3R4LGFBBVCsetQcxOTdFwczwdo6shveWkEtTtAmcVqoLs0AoaW26aMvJf1cHReT6t49f
 jXgQ==
X-Gm-Message-State: AC+VfDwui7g+B1G4KnAHzBftkZpLeGFlFSlgvHbxKTr8Woro64ul7BpA
 02nR2lBnIkPI5ZRKYuSwHl31OqC8phJJ3/CC34P/C82ZzptQ4m77EC0I7ibk/Xe03Cp8IcPWdat
 ZEAuGEG9RJnbEaZ7yYgLNXA==
X-Received: by 2002:a17:902:ab14:b0:1ac:71a7:a1fb with SMTP id
 ik20-20020a170902ab1400b001ac71a7a1fbmr9173015plb.18.1684722070543; 
 Sun, 21 May 2023 19:21:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vgpUHg5KMr5fvVKnKuCGiBu82Kta1T/m+fZ4YXIOR/n75V5hEd2a8qnobD9FuM9h7/ryidw==
X-Received: by 2002:a17:902:ab14:b0:1ac:71a7:a1fb with SMTP id
 ik20-20020a170902ab1400b001ac71a7a1fbmr9172986plb.18.1684722070171; 
 Sun, 21 May 2023 19:21:10 -0700 (PDT)
Received: from [10.72.12.68] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b001ae44cd96besm3520183plb.135.2023.05.21.19.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 19:21:08 -0700 (PDT)
Message-ID: <745e2a68-ed19-dc3d-803a-a7d1d47903dd@redhat.com>
Date: Mon, 22 May 2023 10:20:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-3-hch@lst.de>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230519093521.133226-3-hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 02/13] filemap: update ki_pos in
 generic_perform_write
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
 Miklos Szeredi <miklos@szeredi.hu>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/23 17:35, Christoph Hellwig wrote:
> All callers of generic_perform_write need to updated ki_pos, move it into
> common code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/ceph/file.c | 2 --
>   fs/ext4/file.c | 9 +++------
>   fs/f2fs/file.c | 1 -
>   fs/nfs/file.c  | 1 -
>   mm/filemap.c   | 8 ++++----
>   5 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index f4d8bf7dec88a8..feeb9882ef635a 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -1894,8 +1894,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		 * can not run at the same time
>   		 */
>   		written = generic_perform_write(iocb, from);
> -		if (likely(written >= 0))
> -			iocb->ki_pos = pos + written;
>   		ceph_end_io_write(inode);
>   	}
>   
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index d101b3b0c7dad8..50824831d31def 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -291,12 +291,9 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
>   
>   out:
>   	inode_unlock(inode);
> -	if (likely(ret > 0)) {
> -		iocb->ki_pos += ret;
> -		ret = generic_write_sync(iocb, ret);
> -	}
> -
> -	return ret;
> +	if (unlikely(ret <= 0))
> +		return ret;
> +	return generic_write_sync(iocb, ret);
>   }
>   
>   static ssize_t ext4_handle_inode_extension(struct inode *inode, loff_t offset,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5ac53d2627d20d..9e3855e43a7a63 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4522,7 +4522,6 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
>   	current->backing_dev_info = NULL;
>   
>   	if (ret > 0) {
> -		iocb->ki_pos += ret;
>   		f2fs_update_iostat(F2FS_I_SB(inode), inode,
>   						APP_BUFFERED_IO, ret);
>   	}
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index f0edf5a36237d1..3cc87ae8473356 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -658,7 +658,6 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
>   		goto out;
>   
>   	written = result;
> -	iocb->ki_pos += written;
>   	nfs_add_stats(inode, NFSIOS_NORMALWRITTENBYTES, written);
>   
>   	if (mntflags & NFS_MOUNT_WRITE_EAGER) {
> diff --git a/mm/filemap.c b/mm/filemap.c
> index b4c9bd368b7e58..4d0ec2fa1c7070 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3957,7 +3957,10 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
>   		balance_dirty_pages_ratelimited(mapping);
>   	} while (iov_iter_count(i));
>   
> -	return written ? written : status;
> +	if (!written)
> +		return status;
> +	iocb->ki_pos += written;
> +	return written;
>   }
>   EXPORT_SYMBOL(generic_perform_write);
>   
> @@ -4036,7 +4039,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		endbyte = pos + status - 1;
>   		err = filemap_write_and_wait_range(mapping, pos, endbyte);
>   		if (err == 0) {
> -			iocb->ki_pos = endbyte + 1;
>   			written += status;
>   			invalidate_mapping_pages(mapping,
>   						 pos >> PAGE_SHIFT,
> @@ -4049,8 +4051,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		}
>   	} else {
>   		written = generic_perform_write(iocb, from);
> -		if (likely(written > 0))
> -			iocb->ki_pos += written;
>   	}
>   out:
>   	current->backing_dev_info = NULL;

LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

Thanks

- Xiubo


