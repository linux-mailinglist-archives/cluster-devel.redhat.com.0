Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC552A0D4
	for <lists+cluster-devel@lfdr.de>; Tue, 17 May 2022 13:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652788561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0Cy9u77u01gfNknz2ymY2X8KK8oTDulyhE2qB2fs1Ls=;
	b=FrieDjmOjcwiZsTgDFxsCz8bG0w96OPB3EEmWxCvVEeVabXKnOrzZvssEC0aYtXEmgzX8m
	XAo3eF20e+pz726/SpMtDiJznKNJ8deb3JWnpq5MNhEQSiPJsJ1+yhcxx35hiB3z/c7l6D
	5N0z8gwWrXpohtlycesa7m5xqmyQMmI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-_z4EKcXJNlu17Y-U-uCfZQ-1; Tue, 17 May 2022 07:56:00 -0400
X-MC-Unique: _z4EKcXJNlu17Y-U-uCfZQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6DCE3C01D96;
	Tue, 17 May 2022 11:55:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB83B4021D9;
	Tue, 17 May 2022 11:55:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80E031947063;
	Tue, 17 May 2022 11:55:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7934D194705F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 17 May 2022 11:55:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5CBE3C44CC8; Tue, 17 May 2022 11:55:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5949FC44CC5
 for <cluster-devel@redhat.com>; Tue, 17 May 2022 11:55:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383B51C08963
 for <cluster-devel@redhat.com>; Tue, 17 May 2022 11:55:58 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-vZMsgDaZOce-EXcKZjVPBg-1; Tue, 17 May 2022 07:55:57 -0400
X-MC-Unique: vZMsgDaZOce-EXcKZjVPBg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso852374wmm.4
 for <cluster-devel@redhat.com>; Tue, 17 May 2022 04:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Cy9u77u01gfNknz2ymY2X8KK8oTDulyhE2qB2fs1Ls=;
 b=x0HXE5A5nU9LoyYjl3YYtnAuvFCwK9dehqoDeHN1OPICp10CKiNXIOZ1jizy2KiwG9
 qP1TV0K/LrJQigd+QL7wZTrT9n01cizIihsYq6DcHiS8iCKzZ5qwi55kuFtO2hE7Hn+z
 hlK5YUwzsdiE49ws80zl3lpzet4uDbtY5KbMnHZzSKiWxStstnesr2GeMAFBkyooLTIX
 oYOErTFsPoT9QC68A/S66pRWI5okqu24hg/2uUqVBDOMT/+N8laKOuZ80TPxF41MTIbM
 JXkI2Pf8d/QeHdMJvlvJW0NIPyCnkK9KB7RmHksV86TwkXbx67OVcl5o7eHe6O49dIRV
 Y8+Q==
X-Gm-Message-State: AOAM530WoFDLu9I/jUpvHWEuJDRX5089aq+QlYiqTkEeqnAKT0TwNhUg
 eczp2vf69koTAHJDrHU7KHORexFodbmI/l2luXeeZPLG8wiZRouc/kzvbKcvjN1yI1JCNhMp0R+
 eFL6AO3evnmPbXXWEViDuEzHMPmx6aTrap0YWmQ==
X-Received: by 2002:adf:e749:0:b0:20d:526:cbfa with SMTP id
 c9-20020adfe749000000b0020d0526cbfamr10129248wrn.349.1652788555491; 
 Tue, 17 May 2022 04:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYds7eoib1r6lFjeK18WcTvwXGPKhyKCgvkeY8dkGEAP8FJh+EH6zUFbrSCYxEKnRgHQQ+KO+iQ1YNZIBE8A0=
X-Received: by 2002:adf:e749:0:b0:20d:526:cbfa with SMTP id
 c9-20020adfe749000000b0020d0526cbfamr10129229wrn.349.1652788555268; Tue, 17
 May 2022 04:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220211155036.108314-1-rpeterso@redhat.com>
In-Reply-To: <20220211155036.108314-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 17 May 2022 13:55:44 +0200
Message-ID: <CAHc6FU5Hr1c7v5Rk2NK-xv_n4QDv2dR9T9epEP6eEe5L4TDxJA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] gfs2: Convert function bh_get to use
 iomap
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 4:51 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, function bh_get used block_map to figure out the
> block it needed to read in from the quota_change file. This patch
> changes it to use iomap directly to make it more efficient.

Thanks, I've applied this with minor cleanups.

There are still a few other users of gfs2_block_map around that should
be converted as well.

Andreas

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/quota.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index dc77080a82bb..91bc3affe460 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -368,8 +368,8 @@ static int bh_get(struct gfs2_quota_data *qd)
>         struct gfs2_inode *ip = GFS2_I(sdp->sd_qc_inode);
>         unsigned int block, offset;
>         struct buffer_head *bh;
> +       struct iomap iomap = { };
>         int error;
> -       struct buffer_head bh_map = { .b_state = 0, .b_blocknr = 0 };
>
>         mutex_lock(&sdp->sd_quota_mutex);
>
> @@ -381,11 +381,18 @@ static int bh_get(struct gfs2_quota_data *qd)
>         block = qd->qd_slot / sdp->sd_qc_per_block;
>         offset = qd->qd_slot % sdp->sd_qc_per_block;
>
> -       bh_map.b_size = BIT(ip->i_inode.i_blkbits);
> -       error = gfs2_block_map(&ip->i_inode, block, &bh_map, 0);
> +       error = gfs2_iomap_get(sdp->sd_qc_inode,
> +                              (loff_t)block << sdp->sd_qc_inode->i_blkbits,
> +                              sdp->sd_sb.sb_bsize, &iomap);
>         if (error)
>                 goto fail;
> -       error = gfs2_meta_read(ip->i_gl, bh_map.b_blocknr, DIO_WAIT, 0, &bh);
> +       if (iomap.addr == IOMAP_NULL_ADDR) {
> +               error = -ENOENT;
> +               goto fail;
> +       }
> +
> +       error = gfs2_meta_read(ip->i_gl, iomap.addr >> sdp->sd_qc_inode->i_blkbits,
> +                              DIO_WAIT, 0, &bh);
>         if (error)
>                 goto fail;
>         error = -EIO;
> --
> 2.34.1
>

