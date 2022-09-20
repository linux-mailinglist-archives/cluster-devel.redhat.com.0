Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1495BE536
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Sep 2022 14:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663675680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zPJACzrEsCJNVT0HDW/OfP6DGDA0paooExp9bG47vJw=;
	b=dl+Y6oSgWgQn1/8gLNw40vKk5azgBLgU31ijOywd3XGdU0aEhVZUtNYU41cpzk5zxx2gGV
	+UGAn/rjbmQy7gsL0piA09ndxnePE4a02jrzNQjj56CO2Ko18mVhvorbl4dKWoP3RML6Ip
	uuN43wHQ8judVarz1ut1/0pvhRsy5T4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-aebdW5xWPEW6adRpjdC4hw-1; Tue, 20 Sep 2022 08:07:59 -0400
X-MC-Unique: aebdW5xWPEW6adRpjdC4hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56F57855311;
	Tue, 20 Sep 2022 12:07:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1184740C83AD;
	Tue, 20 Sep 2022 12:07:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C15271946A40;
	Tue, 20 Sep 2022 12:07:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BCD8719465A4 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 20 Sep 2022 12:07:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8F571C15BA8; Tue, 20 Sep 2022 12:07:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8782DC15BA5
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 12:07:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A14D3C01E01
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 12:07:56 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-84i57PKZMj6_avbBdtePqQ-1; Tue, 20 Sep 2022 08:07:55 -0400
X-MC-Unique: 84i57PKZMj6_avbBdtePqQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 b10-20020ac8540a000000b0035ba387b0d1so1656719qtq.15
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 05:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zPJACzrEsCJNVT0HDW/OfP6DGDA0paooExp9bG47vJw=;
 b=GNOjPQMz4CBwfLcg+xegpV1m6HDOAjO0WUaLz+iCYf1NVE7icSY6hgCIfp5xNw9g5h
 sMBT5Pp51+hCDcrRSjWrFoqIGGMF7KuSsWnzbyXUNWXcV6fCBbOmtR9smO4zmGMP39X2
 bw+yzXKBkQDOL6e7CKURIcwPtySF38Awar9IZ5WQQS4vgRHQYQp9pV9r7Ccicgkw1FQC
 yeTK66WYCqAi+ABB3IhArCgZcJRpBRy5yH1KfpIgRa0ctkDfbErhc4XFZgmvF0hGarDw
 UP3A3/ID1ansId2JXlVDv8UwM+t4+/ipfbyE9TYs/SXeWVV7PIjNfOfQZUTTwGMVbrUV
 0P9Q==
X-Gm-Message-State: ACrzQf1Gu2/7DcrUNcbPpg45Ay4FjoSWn9Bgk+ckL4ID94MqGYqPxcql
 xThGy2UDQdGS3INpCFYdqM3JTP9sTgaXKPN0h1u25rYkMx8xsrK3RQ0blEZDa73tY6o0PB1Bjvl
 sakY0nEi8rwDQpWryGFAAkQ==
X-Received: by 2002:a37:a9c6:0:b0:6cc:f925:132f with SMTP id
 s189-20020a37a9c6000000b006ccf925132fmr15876019qke.4.1663675674879; 
 Tue, 20 Sep 2022 05:07:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Exmbxabjxv76UuHD11SNE+TrMFQE+DGEESWaZIW7t7YdlWjiKLUz+lnxdQpngMh0/2ItNrg==
X-Received: by 2002:a37:a9c6:0:b0:6cc:f925:132f with SMTP id
 s189-20020a37a9c6000000b006ccf925132fmr15876002qke.4.1663675674660; 
 Tue, 20 Sep 2022 05:07:54 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 g16-20020ac84810000000b0033c36ef019esm790418qtq.63.2022.09.20.05.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 05:07:50 -0700 (PDT)
Message-ID: <3e6912e8-dc86-9044-d522-529b62aa8e0d@redhat.com>
Date: Tue, 20 Sep 2022 13:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
From: Andrew Price <anprice@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>
References: <20220817122200.200359-1-anprice@redhat.com>
In-Reply-To: <20220817122200.200359-1-anprice@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] gfs2: Check sb_bsize_shift after
 reading superblock
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I've pushed this patch to my git repo:

   git fetch https://gitlab.com/andyprice/linux.git bsize_shift_check
   git show FETCH_HEAD

Andy

On 17/08/2022 13:22, Andrew Price wrote:
> Fuzzers like to scribble over sb_bsize_shift but in reality it's very
> unlikely that this field would be corrupted on its own. Nevertheless it
> should be checked to avoid the possibility of messy mount errors due to
> bad calculations. It's always a fixed value based on the block size so
> we can just check that it's the expected value.
> 
> Tested with:
> 
>      mkfs.gfs2 -O -p lock_nolock /dev/vdb
>      for i in 0 -1 64 65 32 33; do
>          gfs2_edit -p sb field sb_bsize_shift $i /dev/vdb
>          mount /dev/vdb /mnt/test && umount /mnt/test
>      done
> 
> Before this patch we get a withdraw after
> 
> [   76.413681] gfs2: fsid=loop0.0: fatal: invalid metadata block
> [   76.413681]   bh = 19 (type: exp=5, found=4)
> [   76.413681]   function = gfs2_meta_buffer, file = fs/gfs2/meta_io.c, line = 492
> 
> and with UBSAN configured we also get complaints like
> 
> [   76.373395] UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:295:19
> [   76.373815] shift exponent 4294967287 is too large for 64-bit type 'long unsigned int'
> 
> After the patch, these complaints don't appear, mount fails immediately
> and we get an explanation in dmesg.
> 
> Reported-by: syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com
> Signed-off-by: Andrew Price <anprice@redhat.com>
> ---
>   fs/gfs2/ops_fstype.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 549879929c84..692e27f8f563 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -178,7 +178,10 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
>   		pr_warn("Invalid block size\n");
>   		return -EINVAL;
>   	}
> -
> +	if (sb->sb_bsize_shift != ffs(sb->sb_bsize) - 1) {
> +		pr_warn("Invalid block size shift\n");
> +		return -EINVAL;
> +	}
>   	return 0;
>   }
>   

