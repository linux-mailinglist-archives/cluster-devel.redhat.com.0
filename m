Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AECA78A151
	for <lists+cluster-devel@lfdr.de>; Sun, 27 Aug 2023 22:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693166529;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=684ZmibV0iRA7W1nKgqEgsL3aMIsGcfp6Zpl3WdJ4DU=;
	b=JWU8b+oImzASLbOP4D8mPEvqKAU4rfljTdSTML/VDI8uV0fVZp6rNOXbbX3p/ztJF9l2YW
	WOO2z9Uoewv9iV32+SGXB4suu3u8HSdVmG+YAYtXFrsApqHSwmZ1sM7hhbxucq7h5skCm+
	PMDAqraS/dLXqLR00uKiOsKqyW05Upw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-N3IM3ctCO8OVP6ByMhSZRg-1; Sun, 27 Aug 2023 16:02:02 -0400
X-MC-Unique: N3IM3ctCO8OVP6ByMhSZRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A304F185A78B;
	Sun, 27 Aug 2023 20:02:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 203352026D4B;
	Sun, 27 Aug 2023 20:01:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7271319465B7;
	Sun, 27 Aug 2023 20:01:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 44A6719465A8 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 20:01:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2715A492C14; Sun, 27 Aug 2023 20:01:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF46492C13
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 20:01:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0339185CCE0
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 20:01:56 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-O7WGOZIpPCiwV1-YXher0Q-1; Sun,
 27 Aug 2023 16:01:54 -0400
X-MC-Unique: O7WGOZIpPCiwV1-YXher0Q-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qaLdS-001NqG-1T; Sun, 27 Aug 2023 19:41:22 +0000
Date: Sun, 27 Aug 2023 20:41:22 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230827194122.GA325446@ZenIV>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230601145904.1385409-4-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 03/12] filemap: update ki_pos in
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
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zeniv.linux.org.uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 01, 2023 at 04:58:55PM +0200, Christoph Hellwig wrote:
> All callers of generic_perform_write need to updated ki_pos, move it into
> common code.

> @@ -4034,7 +4037,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		endbyte = pos + status - 1;
>  		err = filemap_write_and_wait_range(mapping, pos, endbyte);
>  		if (err == 0) {
> -			iocb->ki_pos = endbyte + 1;
>  			written += status;
>  			invalidate_mapping_pages(mapping,
>  						 pos >> PAGE_SHIFT,
> @@ -4047,8 +4049,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		}
>  	} else {
>  		written = generic_perform_write(iocb, from);
> -		if (likely(written > 0))
> -			iocb->ki_pos += written;
>  	}
>  out:
>  	return written ? written : err;

[another late reply, sorry]

That part is somewhat fishy - there's a case where you return a positive value
and advance ->ki_pos by more than that amount.  I really wonder if all callers
of ->write_iter() are OK with that.  Consider e.g. this:

ssize_t ksys_write(unsigned int fd, const char __user *buf, size_t count)
{
        struct fd f = fdget_pos(fd);
        ssize_t ret = -EBADF;

        if (f.file) {
                loff_t pos, *ppos = file_ppos(f.file);
                if (ppos) {
                        pos = *ppos;   
                        ppos = &pos;
                }
                ret = vfs_write(f.file, buf, count, ppos);
                if (ret >= 0 && ppos)
                        f.file->f_pos = pos;
                fdput_pos(f);
        }

        return ret;
}

ssize_t vfs_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
{
        ssize_t ret;

        if (!(file->f_mode & FMODE_WRITE))
                return -EBADF;
        if (!(file->f_mode & FMODE_CAN_WRITE))
                return -EINVAL;
        if (unlikely(!access_ok(buf, count)))
                return -EFAULT;

        ret = rw_verify_area(WRITE, file, pos, count);
        if (ret)
                return ret;
        if (count > MAX_RW_COUNT)
                count =  MAX_RW_COUNT;
        file_start_write(file);
        if (file->f_op->write)
                ret = file->f_op->write(file, buf, count, pos);
        else if (file->f_op->write_iter)
                ret = new_sync_write(file, buf, count, pos);
        else   
                ret = -EINVAL;
        if (ret > 0) {
                fsnotify_modify(file);
                add_wchar(current, ret);
        }
        inc_syscw(current);
        file_end_write(file);
        return ret;
}

static ssize_t new_sync_write(struct file *filp, const char __user *buf, size_t len, loff_t *ppos)
{
        struct kiocb kiocb;
        struct iov_iter iter;
        ssize_t ret; 

        init_sync_kiocb(&kiocb, filp);
        kiocb.ki_pos = (ppos ? *ppos : 0);
        iov_iter_ubuf(&iter, ITER_SOURCE, (void __user *)buf, len);

        ret = call_write_iter(filp, &kiocb, &iter);
        BUG_ON(ret == -EIOCBQUEUED);
        if (ret > 0 && ppos)
                *ppos = kiocb.ki_pos;
        return ret;
} 

Suppose ->write_iter() ends up doing returning a positive value smaller than
the increment of kiocb.ki_pos.  What do we get?  ret is positive, so
kiocb.ki_pos gets copied into *ppos, which is ksys_write's pos and there
we copy it into file->f_pos.

Is it really OK to have write() return 4096 and advance the file position
by 16K?  AFAICS, userland wouldn't get any indication of something
odd going on - just a short write to a regular file, with followup write
of remaining 12K getting quietly written in the range 16K..28K.

I don't remember what POSIX says about that, but it would qualify as
nasty surprise for any userland program - sure, one can check fsync()
results before closing the sucker and see if everything looks fine,
but the way it's usually discussed could easily lead to assumption that
(synchronous) O_DIRECT writes would not be affected by anything of that
sort.

