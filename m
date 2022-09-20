Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1725BE56D
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Sep 2022 14:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663676062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WbxXzOsoSW53Syf7VDBdFYO0HACVzJYNDsagpuUD5AU=;
	b=inCty6H9sMT4JpcZa0/ngkg5lg3b3uY1mPnBmUvN/iEeXBe0VTmaxqW0VcOUNkGLUfeINq
	9AiWfTve6xvDsuplHeTyfD1mdVteb5t5W93IWn6n/OSmILyDEdzjAvZJhuBdaoRnL9yE0b
	0oeoVMU8XXs9TvuDk+3uUENg/cnu7h8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-cDI9skdhO1WNBO-D4MlFGQ-1; Tue, 20 Sep 2022 08:14:21 -0400
X-MC-Unique: cDI9skdhO1WNBO-D4MlFGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D2E3101E148;
	Tue, 20 Sep 2022 12:14:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71842492B1A;
	Tue, 20 Sep 2022 12:14:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 513D419465B9;
	Tue, 20 Sep 2022 12:14:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FA3019465A4 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 20 Sep 2022 12:14:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E432D23177; Tue, 20 Sep 2022 12:14:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC9F01759F
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 12:14:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B3E1811E81
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 12:14:18 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-IVzYARYuOWObZTaekMr9GQ-1; Tue, 20 Sep 2022 08:14:17 -0400
X-MC-Unique: IVzYARYuOWObZTaekMr9GQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 a12-20020a65604c000000b0042a8c1cc701so1527569pgp.1
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 05:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WbxXzOsoSW53Syf7VDBdFYO0HACVzJYNDsagpuUD5AU=;
 b=D97BSrofMtDTqaeypqa84+XIBs0oDc/lwZhGw2yCLi8rxrz2nkz4f3P0QuwTDA1kRm
 Hl75ejZ4qBWZVMHX6NppUhVaWAX6+JMlpzoBVsHWSqIFyGlRn6C/fryqM+TLwPW+KWJk
 UP5qz0S8dtYfq5I5/9u1lKfxqx+z+ahJQrVz19AqjUWb3V37lF1stlTOABALLuNbIIBf
 ezHnmECgvid18AZ2WDcqgQqXruOjE+6pq1N8HYV0dC4GzY7KdN8yS+mNi2B1K1tKtdfr
 kEYLmIhKkjx2sXAn3qmu9adIiVX0jFhlcLNkAGLlVYAkrmcc3rgSsVAVc4ne4tGgR7P8
 ymXw==
X-Gm-Message-State: ACrzQf3sSKcxSqZlsnhZyJPqZeG26DsPTJeT3MJi71y2SU4LbqbSF0tX
 7IjS2NUOl1GbVPeSvcoS+sE3DqtgsU3oaRFI0FIRUtgO+Jlljelevn8TVVPUUg6j3EpjPysgJz5
 R2h4RzpcxS1vYFY0srU2GtSSL0RymFc89ZpE6BA==
X-Received: by 2002:a17:90a:fc98:b0:202:52cf:c117 with SMTP id
 ci24-20020a17090afc9800b0020252cfc117mr3542904pjb.26.1663676056044; 
 Tue, 20 Sep 2022 05:14:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ocaMEnGC+PiXxA3UKUFqDk/2Tr+OY9Pw3JTqPteiz5DuAgS92bX0UJhs+DSNXW09tHx9AnrN9sk1uC5HV+GE=
X-Received: by 2002:a17:90a:fc98:b0:202:52cf:c117 with SMTP id
 ci24-20020a17090afc9800b0020252cfc117mr3542874pjb.26.1663676055706; Tue, 20
 Sep 2022 05:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220817122200.200359-1-anprice@redhat.com>
In-Reply-To: <20220817122200.200359-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 20 Sep 2022 14:14:04 +0200
Message-ID: <CAHc6FU5v26MOm+MT-gZJCAXKMdLirtBW=n9or26yUSjXbybDsw@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: cluster-devel@redhat.com,
 syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022 at 3:17 PM Andrew Price <anprice@redhat.com> wrote:
> Fuzzers like to scribble over sb_bsize_shift but in reality it's very
> unlikely that this field would be corrupted on its own. Nevertheless it
> should be checked to avoid the possibility of messy mount errors due to
> bad calculations. It's always a fixed value based on the block size so
> we can just check that it's the expected value.
>
> Tested with:
>
>     mkfs.gfs2 -O -p lock_nolock /dev/vdb
>     for i in 0 -1 64 65 32 33; do
>         gfs2_edit -p sb field sb_bsize_shift $i /dev/vdb
>         mount /dev/vdb /mnt/test && umount /mnt/test
>     done
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
>  fs/gfs2/ops_fstype.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 549879929c84..692e27f8f563 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -178,7 +178,10 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
>                 pr_warn("Invalid block size\n");
>                 return -EINVAL;
>         }
> -
> +       if (sb->sb_bsize_shift != ffs(sb->sb_bsize) - 1) {
> +               pr_warn("Invalid block size shift\n");
> +               return -EINVAL;
> +       }
>         return 0;
>  }
>
> --
> 2.37.1

Added now; sorry for overlooking this.

Thanks,
Andreas

